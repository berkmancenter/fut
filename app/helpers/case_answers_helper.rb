module CaseAnswersHelper
	def setColor(result)
	    if ( result == "Fair Use" || result == 1)
	      'fair'
	    elsif (result == "Not Fair Use" || result == -1)
	      'not-fair'
	    else
	      'draw'
	    end
 	end

 	def setIcon(value)
	    if (value == 1)
	      'fu.png'
	    elsif (value == -1)
	      'nfu.png'
	    else
	      'un.png'
	    end
 	end
end
