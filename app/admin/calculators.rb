ActiveAdmin.register Calculator do
	actions :all, :except => [:new, :edit]
	
	scope :all, :default => true

	index do 
		column :id, :sortable => :id do |calculator|
    		link_to calculator.id, admin_calculator_path(calculator)	
  		end	
    	 column "Result" do |calculator|
    		status_tag (calculator.test_answer.get_result), (calculator.test_answer.result ? :ok : :error)
    	end
	    default_actions
  	end
  	filter :id
  	
  	show do
  		panel "Calculator Details" do
    		attributes_table_for calculator do
				row("Status") {status_tag (calculator.test_answer.get_result), (calculator.test_answer.result ? :ok : :error)} 			 
				answers_of_calculator = calculator.test_answer.get_answers
    			questions = Question.all
    			for i in 0..5
    				row(questions[i].flag) { link_to answers_of_calculator[i].content, admin_answer_path(answers_of_calculator[i]) }
    			end 
			end
		end
		active_admin_comments
  	end    
end
