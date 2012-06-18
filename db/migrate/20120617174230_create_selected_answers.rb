class CreateSelectedAnswers < ActiveRecord::Migration
  def change
    create_table :selected_answers do |t|
    	t.integer :test_id
      	t.integer :owner_id 
      	t.integer :answer_id  
    	t.timestamps
    end
    add_index :selected_answers,:test_id
    add_index :selected_answers,:owner_id
    add_index :selected_answers,:answer_id
  end
end
