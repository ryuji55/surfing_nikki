class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :board_id
      t.integer :comment_id
      t.integer :favorite_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
    add_index :notices, :visitor_id
    add_index :notices, :visited_id
    add_index :notices, :board_id
    add_index :notices, :comment_id
    add_index :notices, :favorite_id
  end
end
