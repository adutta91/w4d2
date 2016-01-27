class Cat < ActiveRecord::Base
  COLORS = %w(
  calico black brown white orange
  )
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLORS,
    message: "not a valid color"}

  has_many :rental_requests,
    :class_name => "CatRentalRequest",
    :foreign_key => :cat_id,
    :dependent => :destroy
end
