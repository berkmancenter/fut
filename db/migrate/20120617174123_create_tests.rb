class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
    	t.string :name
    	t.integer :owner_id 
      	t.timestamps
    end
  end
end
