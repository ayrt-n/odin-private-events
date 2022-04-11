class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_events, foreign_key: 'attended_event_id'
  has_many :attendees, through: :user_events

  def self.past
    self.where('end_time < :current_time', { current_time: Time.now })
  end

  def self.upcoming
    self.where('end_time >= :current_time', { current_time: Time.now })
  end
end
