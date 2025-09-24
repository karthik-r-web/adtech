class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date,   type: DateTime
  field :reason, type: String

  belongs_to :doctor
  belongs_to :patient

  validates :date, presence: true
  validates :reason, length: { maximum: 200 }
  validate :date_cannot_be_in_the_past
  validate :date_must_be_within_a_year

  private

  # No past dates allowed
  def date_cannot_be_in_the_past
    if date.present? && date < Time.current
      errors.add(:date, "cannot be in the past")
    end
  end

  # ⏳ Limit booking window
  def date_must_be_within_a_year
    if date.present? && date > 1.year.from_now
      errors.add(:date, "must be within one year from today")
    end
  end
  end
