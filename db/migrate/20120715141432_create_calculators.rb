class CreateCalculators < ActiveRecord::Migration
  def change
    create_table :calculators do |t|
    	t.references :owner, :polymorphic => true, :null => false 
    	t.timestamps
    end
    add_index :calculators,:owner_id
  end
end
