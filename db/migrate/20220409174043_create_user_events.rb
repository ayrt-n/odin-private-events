class CreateUserEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :user_events do |t|
      t.belongs_to :attended_event, foreign_key: {to_table: :events}
      t.belongs_to :attendee, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
