class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps null: false
    end
  end
  def down
  	drop_table :comments
  end
end
