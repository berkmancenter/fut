ActiveAdmin.register Case do
	# form do |f|
	# 	f.inputs :name => "Author", :for => :court_decision do |c|
	#     	c.input :purpose_id
	#     	c.input :character_id
	#     	c.input :use_id
	#     	c.input :nature_id
	#     	c.input :amount_id
	#     	c.input :financial_id
	#     end
	#     f.buttons
	# end
	form :partial => "form"
end
