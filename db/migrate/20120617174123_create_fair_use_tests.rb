class CreateFairUseTests < ActiveRecord::Migration
  def change
    create_table :fair_use_tests do |t|
    	t.string :name
    	t.references :owner, :polymorphic => true
    	t.boolean :result 
      	t.timestamps
    end
    add_index :fair_use_tests,:owner_id
  end
end
