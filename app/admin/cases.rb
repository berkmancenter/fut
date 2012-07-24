ActiveAdmin.register Case do
	menu :label => "Legal Cases"
	controller do
		def new
			@case = Case.new
			@case.build_court_decision
			@case.build_court_decision_detail
			@case.build_original_resource
			@case.build_derivative_resource
		end
	end

	index do 
		column :id, :sortable => :id do |c|
    		link_to c.id, admin_case_path(c)	
  		end	
	    column :title do |c|
    		link_to c.title, admin_case_path(c)
    	end
    	column "Original" do |c|
    		image_tag(c.original_resource.source.url(:thumb), :height => '50')
  		end
  		column "Derivative" do |c|
    		image_tag(c.derivative_resource.source.url(:thumb), :height => '50')
  		end		
	    default_actions
  	end

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

	show :title => :title do |c|
  		
    		attributes_table()  do
				row("Title") { c.title }
				row("Original Resource") do
          			image_tag(c.original_resource.source.url(:thumb))
        		end
        		row("Derivative Resource") do
          			image_tag(c.derivative_resource.source.url(:thumb))
        		end
				row("Facts") {c.facts}
				row("Facts") {c.roles.each { |r| r.name}}				
    		end
    		
    		attributes_table  do
    			@court_report = c.get_report
    			for i in 0..5
	    			row(Question.all[i].flag.capitalize) do
	    				link_to(@court_report[i][:answer].content, admin_answer_path(@court_report[i][:answer])) + " - " + @court_report[i][:court_details]		
					end
				end
    		end
  		
 		active_admin_comments
	end
	# show :title => :title do
 #  		panel "Case Details" do
 #    		attributes_table_for legal_case do
 #    			row("Title") { legal_case.title }
	# 			row("Facts") { legal_case.facts }
	# 		end
 #  		end
 # 		active_admin_comments
	# end
end
