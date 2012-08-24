class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
    	t.string :name
    	t.text :explanation
    	t.integer :question_id	
      	t.timestamps
    end
    add_index :aspects,:question_id
  end
end
