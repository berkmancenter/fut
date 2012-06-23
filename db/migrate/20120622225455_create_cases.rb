class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
    	t.string :title
		t.text :facts
		t.integer :no_of_tests
		t.integer :court_decision_id
		t.integer :original_resource_id
		t.integer :derivative_resource_id
    	t.timestamps
    end
  end
end
