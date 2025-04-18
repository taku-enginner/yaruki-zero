import Chart from "chart.js/auto";

document.addEventListener("turbo:load", () => {
  const ctx = document.getElementById("motivationChart");
  if (!ctx) return;

  // すでにチャートが存在している場合は破棄（再描画のため）
  if (ctx.chartInstance) {
    ctx.chartInstance.destroy();
  }

  const chart = new Chart(ctx, {
    type: "line",
    data: {
      labels: JSON.parse(ctx.dataset.labels),
      datasets: [{
        label: "やる気",
        data: JSON.parse(ctx.dataset.values),
        borderColor: "rgb(120, 120, 120)",
        backgroundColor: "rgba(200, 200, 200, 0.2)",
        tension: 0.2,
        fill: false,
        pointRadius: 3,
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
