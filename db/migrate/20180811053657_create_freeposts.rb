class CreateFreeposts < ActiveRecord::Migration[5.2]
  def change
    create_table :freeposts do |t|
      t.integer :username
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
