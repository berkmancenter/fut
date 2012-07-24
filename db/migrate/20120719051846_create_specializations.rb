class CreateSpecializations < ActiveRecord::Migration
  def change
    create_table :specializations do |t|
    	t.integer :legal_cases_id
	    t.integer :role_id
        t.timestamps
    end
    add_index :specializations, [:legal_cases_id,:role_id]
  end
end
