class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.text :message
      t.text :user_id
      t.text :user_email

      t.timestamps
    end
  end
end
