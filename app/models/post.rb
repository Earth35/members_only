class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 10 }
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
  
  belongs_to :user
end
