class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :direction
      t.references :floor, index: true

      t.timestamps null: false
    end
    add_foreign_key :cars, :floors
  end
end
