class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_events, foreign_key: 'attended_event_id', dependent: :destroy
  has_many :attendees, through: :user_events

  validates :name, :location, :description, :start_time, :end_time, presence: true
  validates :start_time, comparison: { less_than: :end_time }

  scope :past, -> { where('end_time < :current_time', { current_time: Time.now }) }
  scope :upcoming, -> { where('end_time >= :current_time', { current_time: Time.now }) }
end
