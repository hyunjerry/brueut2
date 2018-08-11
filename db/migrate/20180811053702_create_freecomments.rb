class CreateFreecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :freecomments do |t|
      t.integer :username
      t.string :content
      t.integer :freepost_id

      t.timestamps
    end
  end
end
