class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
    	t.string :source_file_name
    	t.string :source_content_type
    	t.integer :source_file_size
    	t.datetime :source_updated_at
    	t.timestamps
    end
  end
end
