class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :reply_to_message, :class_name => 'Message'
  validates_presence_of :message, :user_id

  scope :recent, order('created_at DESC').limit(10)
end
