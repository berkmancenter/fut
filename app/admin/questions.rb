ActiveAdmin.register Question do
	scope :all, :default => true
  scope :essential do |answers|
      answers.where('essential = ?', true)
  end
  scope :quiz do |answers|
      answers.where('essential = ?', false)
  end
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
	filter :hint

  show :title => :content do
  	panel "Question Details" do
    	attributes_table_for question do
				row("Content") { question.content }
				row("Hint") { question.hint }
    	end
  	end
 		active_admin_comments
	end
end
