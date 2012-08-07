class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
    	t.string :name
    	t.text :explanation	
      	t.timestamps
    end
  end
end
