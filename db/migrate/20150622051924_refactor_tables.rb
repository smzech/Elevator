class RefactorTables < ActiveRecord::Migration
  def change
  	remove_column :passengers, :floor_id
  	add_column :passengers, :destination, :integer
  end
end
