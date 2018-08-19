class CreateFreeposts < ActiveRecord::Migration[5.2]
  def change
    create_table :freeposts do |t|
      t.string :username
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
