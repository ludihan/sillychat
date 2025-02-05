class CreateChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.boolean :is_private, default: false

      t.timestamps
    end
    add_index :channels, :name, unique: true
  end
end
