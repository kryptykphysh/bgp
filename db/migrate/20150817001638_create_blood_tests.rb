class CreateBloodTests < ActiveRecord::Migration
  def change
    create_table :blood_tests do |t|
      t.float :bgl, null: false
      t.float :mass
      t.text :comment

      t.timestamps null: false
    end
  end
end
