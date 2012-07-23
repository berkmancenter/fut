ActiveAdmin.register Question do
	index do 
		column :id, :sortable => :id do |question|
    		link_to question.id, admin_question_path(question)	
  		end	
	    column :content do |question|
    		link_to question.content, admin_question_path(question)
    	end
	    default_actions
  	end
  	 
  	filter :content
  	filter :explanation

  	show do
  		panel "Question Details" do
    		attributes_table_for question do
				row("Content") { question.content }
				row("Explanation") { question.explanation }
    		end
  		end
 		active_admin_comments
	end
end
