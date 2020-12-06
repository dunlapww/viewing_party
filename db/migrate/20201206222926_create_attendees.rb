class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :viewing_party, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end
  end
end
