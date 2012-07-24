class CreateSpecializations < ActiveRecord::Migration
  def change
    create_table :specializations do |t|
    	t.integer :legal_case_id
	    t.integer :role_id
        t.timestamps
    end
    add_index :specializations, [:legal_case_id,:role_id]
  end
end
