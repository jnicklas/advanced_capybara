class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :message
      t.integer :user_id
      t.integer :reply_to_message_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
