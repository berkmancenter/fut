ActiveAdmin.register Case do
	controller do
		def new
			@case = Case.new
			@case.build_court_decision
			@case.build_original_resource
			@case.build_derivative_resource
		end
	end


	form do |f|
		f.inputs "Basic Details" do
	    	f.input :title
	    	f.input :facts
	    end

	    f.inputs "Original Resource", :for => :original_resource do |o|
	    	o.input :source
	    	
	    end
	     f.inputs "Derivative Resource", :for => :derivative_resource do |d|
	    	d.input :source
	    	
	    end

		f.inputs :name => "Court Decision", :for => :court_decision do |c|
	    	c.input :purpose_id, :as => :select, :collection => Hash[Question.all[0].answers.map{|a| [a.content,a.id]}]
	    	c.input :character_id, :as => :select, :collection => Hash[Question.all[1].answers.map{|a| [a.content,a.id]}]
	    	c.input :use_id, :as => :select, :collection => Hash[Question.all[2].answers.map{|a| [a.content,a.id]}]
	    	c.input :nature_id, :as => :select, :collection => Hash[Question.all[3].answers.map{|a| [a.content,a.id]}]
	    	c.input :amount_id, :as => :select, :collection => Hash[Question.all[4].answers.map{|a| [a.content,a.id]}]
	    	c.input :financial_id, :as => :select, :collection => Hash[Question.all[5].answers.map{|a| [a.content,a.id]}]
	    end

	    f.inputs "Characters" do
	    	f.input :roles, :as => :check_boxes, :collection => Role.all
	    end
	    f.buttons
	end
	# form :partial => "form"
end
