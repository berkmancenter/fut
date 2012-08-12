ActiveAdmin.register Aspect do
	index do 
		column :id, :sortable => :id do |aspect|
    		link_to aspect.id, admin_aspect_path(aspect)	
  		end	
    	column :name do |aspect|
    		link_to aspect.name, admin_aspect_path(aspect)
    	end
    	default_actions
  	end
  	filter :name 
end
