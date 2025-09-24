class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,           type: String
  field :specialization, type: String
  field :phone,          type: String
  field :email,          type: String

  # Associations
  has_many :appointments, dependent: :destroy

  validates :name, :specialization, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
  validates :email, presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }
end
