class CreateTestAnswers < ActiveRecord::Migration
  def change
    create_table :test_answers do |t|
      	t.integer :purpose_id, :null => false
        t.integer :character_id, :null => false 
        t.integer :use_id, :null => false 
        t.integer :nature_id, :null => false 
        t.integer :amount_id, :null => false 
        t.integer :financial_id, :null => false
        t.boolean :result   
    	t.timestamps
    end
    add_index :test_answers,:purpose_id
    add_index :test_answers,:character_id
    add_index :test_answers,:use_id
    add_index :test_answers,:nature_id
    add_index :test_answers,:amount_id
    add_index :test_answers,:financial_id
  end
end
