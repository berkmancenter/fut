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

  show :title => :name do
    panel "Aspect Details" do
      attributes_table_for aspect do
        row("name") { aspect.name }
        row("Explanation") { aspect.explanation }
        row("Question") {link_to aspect.question.hint, admin_question_path(aspect.question) }
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Basic Details" do
        f.input :name
        f.input :explanation
        f.input :question_id, :as => :select, :collection => Hash[Question.essential.map{|q| [q.content,q.id]}]
      end
    f.buttons
  end
end
