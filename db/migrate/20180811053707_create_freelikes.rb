class CreateFreelikes < ActiveRecord::Migration[5.2]
  def change
    create_table :freelikes do |t|
      t.integer :user_id
      t.integer :freepost_id
      t.timestamps
    end
  end
end
