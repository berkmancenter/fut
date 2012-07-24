ActiveAdmin.register Answer do
	scope :all, :default => true
	scope :Purpose do |answers|
  		answers.where('question_id = ?', 1)
	end
	scope :Character do |answers|
  		answers.where('question_id = ?', 2)
	end
	scope :Use do |answers|
  		answers.where('question_id = ?', 3)
	end
	scope :Nature do |answers|
  		answers.where('question_id = ?', 4)
	end
	scope :Amount do |answers|
  		answers.where('question_id = ?', 5)
	end
	scope :Financial do |answers|
  		answers.where('question_id = ?', 6)
	end
	
	index do 
		column :id, :sortable => :id do |answer|
    		link_to answer.id, admin_answer_path(answer)	
  		end	
	    column :content do |answer|
    		link_to answer.content, admin_answer_path(answer)
    	end
	    column :value do |answer|
	    	if answer.value == 1	
	    		status_tag "Green", :ok 
	    	elsif answer.value == 0
	    		status_tag "Draw", :warning 
	    	else
	    		status_tag "Red", :error 
	    	end
	    			
	    end		
	    default_actions
  	end

  	filter :content
  	filter :value, :as => :select, :collection => { "Green"=> 1, "Red" => -1, "Draw" => 0 }
  	filter :explanation

	form do |f|
		f.inputs "Answers" do
	    	f.input :question, :member_label => :content 
	    	f.input :content
	    	f.input :value, :as => :select, :collection => { "Green"=> 1, "Red" => -1, "Draw" => 0 }
	    	f.input :explanation
	    end
	    f.buttons
	end

	show :title => :content do
  		panel "Answer Details" do
    		attributes_table_for answer do
    			row("Question") { link_to answer.question.content, admin_question_path(answer.question) }
				row("Content") { answer.content }
				row("Value") do
					if answer.value == 1	
	    				status_tag "Green", :ok 
	    			elsif answer.value == 0
	    				status_tag "Draw", :warning 
	    			else
	    				status_tag "Red", :error 
	    			end
				end
				row("Explanation") { answer.explanation }
    		end
  		end
 		active_admin_comments
	end
end
