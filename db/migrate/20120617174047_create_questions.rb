class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      	t.string :content 
        t.text :explanation
        t.integer :aspect_id
      	t.timestamps
    end
  	add_index :questions,:aspect_id
  end
end