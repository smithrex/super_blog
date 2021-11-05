class Post < ApplicationRecord
  belongs_to :blog
  belongs_to :user

  validates :title, :content, 
  presence: true
end
