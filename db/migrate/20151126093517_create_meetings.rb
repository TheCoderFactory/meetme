class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.text :reason
      t.string :street
      t.string :suburb
      t.string :postcode
      t.string :state
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :organiser_id

      t.timestamps null: false
    end
  end
end
