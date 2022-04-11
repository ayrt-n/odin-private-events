class AddIndexToUserEvents < ActiveRecord::Migration[7.0]
  def change
    add_index :user_events, [:attendee_id, :attended_event_id], unique: true, name: 'by_attendee_and_event'
  end
end
