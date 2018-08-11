class CreateFreedislikes < ActiveRecord::Migration[5.2]
  def change
    create_table :freedislikes do |t|

      t.timestamps
    end
  end
end
