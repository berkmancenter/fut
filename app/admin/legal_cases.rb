ActiveAdmin.register LegalCase do
	menu :label => "Legal Cases"

	# scope :film_maker, joins(:roles).where('roles.name = ?', "Film Maker")
	
	controller do
		def new
			@legal_case = LegalCase.new
			@legal_case.build_court_decision
			@legal_case.build_court_decision_detail
			@legal_case.build_original_resource
			@legal_case.build_derivative_resource
		end
	end

	index do 
		column :id, :sortable => :id do |legal_case|
    		link_to legal_case.id, admin_legal_case_path(legal_case)	
  		end	
	    column :title do |legal_case|
    		link_to legal_case.title, admin_legal_case_path(legal_case)
    	end
    	column "Original" do |legal_case|
    		image_tag(legal_case.original_resource.source.url(:thumb), :height => '50')
  		end
  		column "Derivative" do |legal_case|
    		image_tag(legal_case.derivative_resource.source.url(:thumb), :height => '50')
  		end
  		column "Status" do |legal_case|
    		status_tag (legal_case.court_decision.get_result), (legal_case.court_decision.result ? :ok : :error)
  		end			
	    default_actions
  	end
  	filter :title
  	filter :facts
  	

	form do |f|
		f.inputs "Basic Details" do
	    	f.input :title
	    	f.input :facts
	    end

	    f.inputs "Original Resource", :for => :original_resource do |o|
	    	o.input :source, :hint => o.template.image_tag(o.object.source.url(:thumb)), :label => "Original Copy", :required => true 	
	    end
	     f.inputs "Derivative Resource", :for => :derivative_resource do |d|
	    	d.input :source, :hint => d.template.image_tag(d.object.source.url(:thumb)), :label => "Derivative Copy", :required => true 
	    end

	    f.inputs "Characters" do
	    	f.input :roles, :label => "Check corresponding roles", :as => :check_boxes, :collection => Role.all
	    end
	    
		f.inputs :name => "Court Decision", :for => :court_decision do |c|
	    	c.input :purpose_id, :as => :select, :collection => Hash[Question.all[0].answers.map{|a| [a.content,a.id]}]
	    	c.input :character_id, :as => :select, :collection => Hash[Question.all[1].answers.map{|a| [a.content,a.id]}]
	    	c.input :use_id, :as => :select, :collection => Hash[Question.all[2].answers.map{|a| [a.content,a.id]}]
	    	c.input :nature_id, :as => :select, :collection => Hash[Question.all[3].answers.map{|a| [a.content,a.id]}]
	    	c.input :amount_id, :as => :select, :collection => Hash[Question.all[4].answers.map{|a| [a.content,a.id]}]
	    	c.input :financial_id, :as => :select, :collection => Hash[Question.all[5].answers.map{|a| [a.content,a.id]}]
	    end	
	    
	    f.inputs :name => "Decision Details", :for => :court_decision_detail do |dd|
	    		dd.input :purpose
	    		dd.input :character
	    		dd.input :use
	    		dd.input :nature
	    		dd.input :amount
	    		dd.input :financial
	    end
	    f.buttons
	end

	show :title => :title do
  		panel "Basic Details" do
    		attributes_table_for legal_case do
    			row("Title") { legal_case.title }
				row("Facts") { legal_case.facts }
				row("Status") {status_tag (legal_case.court_decision.get_result), (legal_case.court_decision.result ? :ok : :error)} 			 
			end
  		end
  		panel "Resources" do
  			attributes_table_for legal_case do
  				row("Original Resource") do
          			image_tag(legal_case.original_resource.source.url(:thumb))
        		end
        		row("Derivative Resource") do
          			image_tag(legal_case.derivative_resource.source.url(:thumb))
        		end
  			end	
  		end
  		panel "Characters" do
	    	table_for legal_case.roles do |t|
	      		t.column("Corresponding Roles to this Case ") { |role| role.name  }
	    	end
 		end
  		panel "Court Decision Details" do
    		attributes_table_for legal_case do
    			@court_report = legal_case.get_report
    			for i in 0..5
	    			row(Question.all[i].flag.capitalize) do
	    				link_to(@court_report[i][:answer].content, admin_answer_path(@court_report[i][:answer])) + " - " + @court_report[i][:court_details]		
					end
				end
			end
  		end
  		
 		active_admin_comments
	end
end
