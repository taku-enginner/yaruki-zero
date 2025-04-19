import Chart from "chart.js/auto";

document.addEventListener("turbo:load", () => {
  const ctx = document.getElementById("motivationChart");
  if (!ctx) return;

  // すでにチャートが存在している場合は破棄（再描画のため）
  if (ctx.chartInstance) {
    ctx.chartInstance.destroy();
  }

  const values = JSON.parse(ctx.dataset.values);
  const labels = JSON.parse(ctx.dataset.labels);

  const isZeroPride = ctx.dataset.zeroPride === "true"; // Railsから渡す想定

  const backgroundColors = values.map(v => (isZeroPride && v === 0 ? "#facc15" : "rgba(200,200,200,0.2)"));
  const borderColors = values.map(v => (isZeroPride && v === 0 ? "#facc15" : "rgb(120,120,120)"));
  const pointStyles = values.map(v => (isZeroPride && v === 0 ? "rectRot" : "circle")); // ドヤ感強調（任意）

  const chart = new Chart(ctx, {
    type: "line",
    data: {
      labels: labels,
      datasets: [{
        label: "やる気",
        data: values,
        backgroundColor: backgroundColors,
        borderColor: borderColors,
        tension: 0.2,
        fill: false,
        pointRadius: 4,
        pointStyle: pointStyles,
      }]
    },
    options: {
      scales: {
        y: { beginAtZero: true, max: 100 }
      }
    }
  });

  // チャートインスタンスを DOM に保持（次回破棄のため）
  ctx.chartInstance = chart;
});
