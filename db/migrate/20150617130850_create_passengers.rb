class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.references :car, index: true
      t.references :floor, index: true

      t.timestamps null: false
    end
    add_foreign_key :passengers, :cars
    add_foreign_key :passengers, :floors
  end
end
