class CreateTestAnswers < ActiveRecord::Migration
  def change
    create_table :test_answers do |t|
      	t.integer :purpose_id
        t.integer :character_id 
        t.integer :use_id 
        t.integer :nature_id 
        t.integer :amount_id 
        t.integer :impact_id
        t.integer :tested_case_id
        t.boolean :result    
    	t.timestamps
    end
    add_index :test_answers,:purpose_id
    add_index :test_answers,:character_id
    add_index :test_answers,:use_id
    add_index :test_answers,:nature_id
    add_index :test_answers,:amount_id
    add_index :test_answers,:impact_id
  end
end
