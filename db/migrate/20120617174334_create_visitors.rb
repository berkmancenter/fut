class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
    	t.string :name, :default => "Anonymous"
    	t.string :ip_adress
    	t.timestamps
    end
  end
end
