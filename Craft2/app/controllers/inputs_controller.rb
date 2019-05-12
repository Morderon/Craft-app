class InputsController < ApplicationController
	def show
		nameArray = params[:Name].split(',')

		@inputs = []
		flash[:notice] = ""
		if(nameArray.length > 1 && params[:any] != "any")
			chk = true
			@inputs = Input.where("Name IN (?)", nameArray).having('COUNT(Recipe_ID) >= ?', nameArray.length).group('Recipe_ID')
    end

		if(@inputs.empty?)
			@inputs = Input.where("Name IN (?)", nameArray)
			if(chk)
				flash[:notice] = "No matches found for all. Displaying matches for any."
			end
	  end
		list = []
		@inputs.find_each do |input|
    	list.push("#{input.Recipe_ID}")
	  end
    skillArray = []
		if(params[:Skill].present?)
			skillArray = params[:Skill].split(',')
	  end
		if(skillArray.empty?)
			skillArray = [1,2,3,4,5,6]
		end

		begin
			@recipes = Recipe.where("ID IN (?) AND Skill IN (?)", list, skillArray)
		rescue => e
			flash[:notice] = "No matching recipes from all supplied items."
			redirect_to skillindex_url
		end
	end
end
