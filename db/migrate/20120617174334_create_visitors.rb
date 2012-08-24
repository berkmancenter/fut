class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
    	t.string :name, :default => "Anonymous"
    	t.string :ip_adress
    	t.integer :role_id
    	t.boolean :quiz, :default => false
    	t.timestamps
    end
    add_index :visitors,:role_id
  end
end
