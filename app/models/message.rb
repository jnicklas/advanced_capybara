class Message < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :message, :user_id

  scope :recent, order('created_at DESC').limit(10)
end
