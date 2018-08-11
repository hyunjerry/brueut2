class CreateFreelikes < ActiveRecord::Migration[5.2]
  def change
    create_table :freelikes do |t|

      t.timestamps
    end
  end
end
