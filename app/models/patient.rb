class Patient
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :appointments
  has_many :doctors


  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :address, type: String
  field :phone, type: String
  field :email, type: String

  #Validations
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, presence: true, inclusion: { in: %w[male female other] }
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  #validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  VALID_EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
  validates :email, presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" }
end

