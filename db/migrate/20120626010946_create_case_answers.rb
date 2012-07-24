class CreateCaseAnswers < ActiveRecord::Migration
  def change
    create_table :case_answers do |t|
    	t.integer :legal_case_id
    	t.references :owner, :polymorphic => true, :null => false 
      	t.timestamps
    end
    add_index :case_answers,:legal_case_id
    add_index :case_answers,:owner_id
  end
end
