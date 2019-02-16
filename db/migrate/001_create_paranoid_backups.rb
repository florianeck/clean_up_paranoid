class CreateParanoidBackups < ActiveRecord::Migration
    create_table :paranoid_backups, :force => true do |t|
      t.string :source_type
      t.integer :source_id
      t.text :data, limit: 10.megabytes
      t.timestamps
    end

    add_index :paranoid_backups, :source_type
    add_index :paranoid_backups, :source_id
end