ActiveAdmin.register CaseAnswer do
	actions :all, :except => [:new, :edit]
	
	scope :all, :default => true
	# LegalCase.all.each do |legal_case|
	#     self.send(:scope, legal_case.title) do |case_answers|
	#       case_answers.where(:legal_case_id => legal_case.id)
	#     end
 #  	end

	index do 
		column :id, :sortable => :id do |case_answer|
    		link_to case_answer.id, admin_case_answer_path(case_answer)	
  		end	
	    column "Case" do |case_answer|
    		link_to case_answer.legal_case.title, admin_legal_case_path(case_answer.legal_case)
    	end	
    	 column "Result" do |case_answer|
    		status_tag (case_answer.test_answer.get_result), (case_answer.test_answer.result ? :ok : :error)
    	end
	    default_actions
  	end
  	# filter :legal_case, :as => :select, :collection => Hash[LegalCase.all.map{|c| [c.title,c.id]}]

  	show do
  		panel "Case Answer Details" do
    		attributes_table_for case_answer do
    			row("Case") { link_to case_answer.legal_case.title, admin_legal_case_path(case_answer.legal_case) }
				row("Status") {status_tag (case_answer.test_answer.get_result), (case_answer.test_answer.result ? :ok : :error)} 			 
			end
		end
		panel "Test Details" do
    		attributes_table_for case_answer do
    			answers_of_case = case_answer.test_answer.get_answers
    			questions = Question.all
    			for i in 0..5
    				row(questions[i].flag) { link_to answers_of_case[i].content, admin_answer_path(answers_of_case[i]) }
    			end 			 
			end
		end
		active_admin_comments
  	end  
end
