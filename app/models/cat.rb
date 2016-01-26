class Cat < ActiveRecord::Base
  COLORS = %w(
  calico black brown white orange
  )
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "not a valid color"}
end
