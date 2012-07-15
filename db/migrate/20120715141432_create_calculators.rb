class CreateCalculators < ActiveRecord::Migration
  def change
    create_table :calculators do |t|

      t.timestamps
    end
  end
end
