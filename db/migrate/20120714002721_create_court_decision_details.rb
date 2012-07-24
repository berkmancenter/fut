class CreateCourtDecisionDetails < ActiveRecord::Migration
  def change
    create_table :court_decision_details do |t|
    	t.integer :case_id
    	t.text :purpose
    	t.text :character
    	t.text :use
    	t.text :nature
    	t.text :amount
    	t.text :financial
      t.timestamps
    end
    add_index :court_decision_details,:case_id
  end
end
