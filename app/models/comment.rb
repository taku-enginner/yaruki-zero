class Comment < ApplicationRecord
  enum tone: {
    tan: 0,
    ironic: 1,
    philosophy: 2
  }
end
