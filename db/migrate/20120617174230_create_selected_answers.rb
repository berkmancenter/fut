class CreateSelectedAnswers < ActiveRecord::Migration
  def change
    create_table :selected_answers do |t|

      t.timestamps
    end
  end
end
