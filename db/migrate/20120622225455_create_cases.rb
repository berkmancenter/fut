class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
    	t.string :title
      t.integer :role_id
		  t.text :facts
		  t.integer :no_of_tests, :default => 0 
      t.integer :court_decision_id
		  t.integer :original_resource_id, :null => false
		  t.integer :derivative_resource_id, :null => false
    	t.timestamps
    end
    add_index :cases,:court_decision_id
    add_index :cases,:original_resource_id
    add_index :cases,:derivative_resource_id
    add_index :cases,:role_id
  end
end