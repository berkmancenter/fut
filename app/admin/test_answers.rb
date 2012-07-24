ActiveAdmin.register TestAnswer do
	controller do
		def new
			@test_answer = TestAnswer.new
			@test_answer.build_court_decision_detail
		end
	end  
end
