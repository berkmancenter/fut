class CreateCalculators < ActiveRecord::Migration
  def change
    create_table :calculators do |t|
    	t.integer :test_answer_id
    	t.references :owner, :polymorphic => true, :null => false 
    	t.timestamps
    end
    add_index :calculators,:test_answer_id
  end
end
