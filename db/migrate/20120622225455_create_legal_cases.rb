class CreateLegalCases < ActiveRecord::Migration
  def change
    create_table :legal_cases do |t|
    	t.string :title
		  t.text :facts
		  t.integer :original_resource_id, :null => false
		  t.integer :derivative_resource_id, :null => false
    	t.timestamps
    end
    add_index :legal_cases,:original_resource_id
    add_index :legal_cases,:derivative_resource_id
  end
end