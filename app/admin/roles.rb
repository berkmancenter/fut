ActiveAdmin.register Role do
	index do 
		column :id, :sortable => :id do |role|
    		link_to role.id, admin_role_path(role)	
  		end	
    	 column :name do |role|
    		link_to role.name, admin_role_path(role)
    	end
	    default_actions
  	end
  	filter :name

  	show :title => :name do
  		panel "Role Details" do
    		attributes_table_for role do
				row("ID") {role.id} 			 
				row("Name") {role.name} 
			end
		end
		panel "Legal Cases" do
	    	table_for role.legal_cases do |t|
	      		t.column("Corresponding Legal Cases to this Role ") { |legal_case| link_to legal_case.title, admin_legal_case_path(legal_case)  }
	    	end
 		end
		active_admin_comments
  	end      
end
