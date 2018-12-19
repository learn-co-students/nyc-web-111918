class Scout < ApplicationRecord

  validates :planet, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 21 }
  validate :hair_color_is_real_color

  def hair_color_is_real_color
    if self.hair_color != "purple"
      errors.add(:hair_color, "sorry brah, must be purple")
    end
  end

end
