class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :scheduled_at, null: false
      t.string :place
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :events, %i(name scheduled_at), unique: true
    add_index :events, :scheduled_at
  end
end
