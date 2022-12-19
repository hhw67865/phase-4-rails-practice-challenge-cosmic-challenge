class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, presence: true
  validates :scientist, presence: true, uniqueness: { scope: :name, message: "scientist cannot join the same mission twice" }
  validates :planet, presence: true

end
