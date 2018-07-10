class User < ApplicationRecord
   validates :username, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: true
   validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end