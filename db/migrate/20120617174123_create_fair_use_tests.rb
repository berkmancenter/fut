class CreateFairUseTests < ActiveRecord::Migration
  def change
    create_table :fair_use_tests do |t|
      	t.integer :test_answer_id, :null => false
    	t.string :name
    	t.references :owner, :polymorphic => true, :null => false
      	t.timestamps
    end
    add_index :fair_use_tests,:test_answer_id
    add_index :fair_use_tests,:owner_id
  end
end
