class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
    	t.string :name
    	t.integer :owner_id
    	t.boolean :result 
      	t.timestamps
    end
    add_index :tests,:owner_id
  end
end
