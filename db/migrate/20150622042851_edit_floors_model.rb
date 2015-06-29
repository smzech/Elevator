class EditFloorsModel < ActiveRecord::Migration
  def self.up
  	rename_column :floors, :name, :level
  	change_column :floors, :level, :integer
  end

  def self.down
  	change_column :floors, :level, :string
  	rename_column :floors, :level, :name
  end
end
