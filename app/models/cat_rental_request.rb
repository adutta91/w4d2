class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :status, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: ['PENDING', 'APPROVED', 'DENIED' ],
    message: "not a valid status"}
  validate :approved_overlapping_requests


  def approved_overlapping_requests
    overlapping_requests.each do |request|
      if request.status == "APPROVED"
        self.errors[:base] << "Overlapping approved requests!"
        break
      end
    end
  end

  def overlapping_requests
    overlapping_req = []
    cats_requests = self.cat.rental_requests
    cats_requests.each do |request|
      overlapping_req << request if overlaps?(request)
    end
    overlapping_req
  end

  def overlaps?(other_request)
    range = other_request.start_date..other_request.end_date

    return true if range === self.start_date || range === self.end_date
    false
  end

  def approve!
    overlapping_requests.each do |request|
      request.deny!
    end
    status = "APPROVED"
    save!
  end

  def deny!
    status = "DENIED"
    save!
  end

  belongs_to :cat,
    :class_name => "Cat",
    :foreign_key => "cat_id"
end
