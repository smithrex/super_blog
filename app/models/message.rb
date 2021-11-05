class Message < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :author, :message, 
  presence: true
end
