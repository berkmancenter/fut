ActiveAdmin.register Attachment do
	index do 
		column :id, :sortable => :id do |attachment|
    		link_to attachment.id, admin_attachment_path(attachment)	
  		end
  		column "Image" do |attachment|
    		# link_to(image_tag(attachment.source.url(:thumb), :height => '50'), admin_attachment_path(attachment))
        link_to(image_tag(attachment.url, :height => '50'), admin_attachment_path(attachment))
  		end		
	    # column :source_file_name do |attachment|
      column :name do |attachment|
    		# link_to attachment.source_file_name.split('.')[0], admin_attachment_path(attachment)
        link_to attachment.name, admin_attachment_path(attachment)
      end
    	# column :source_content_type
    	# column :source_file_size
    	
	    default_actions
  	end
  	# filter :source_file_name
  	# filter :source_content_type
    filter :name

	# form :html => { :enctype => "multipart/form-data" } do |f|
   	form do |f|	
      f.inputs "Attachment details" do
		    f.input :name
        f.input :url
  		end
 		 f.buttons
 	end

 	show :title => :name do
  		panel "Attachment Details" do
    		attributes_table_for attachment do
    		# row("Image") { image_tag attachment.source.url(:thumb)}
        # row("Name") { attachment.source_file_name.split('.')[0] }
        # row("Image") { image_tag attachment.source.url(:thumb)}
        # row("Content Type") { attachment.source_content_type }
        row("Name") { attachment.name }
        row("Image") { image_tag attachment.url, :height => '300'}		
    		end
  		end
 		active_admin_comments
	end 
end
