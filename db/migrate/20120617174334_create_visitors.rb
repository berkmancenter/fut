class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
    	t.string :name
    	t.string :ip_adress
    	t.timestamps
    end
  end
end
