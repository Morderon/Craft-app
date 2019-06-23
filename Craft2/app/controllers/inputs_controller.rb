class InputsController < ApplicationController
	#lists recipes by material
	def show
		nameArray = params[:Name].split(',')

		@inputs = []
		flash[:notice] = ""
		#get skill selection, or all skills if there's an error or they're not provided
		skillArray = []
		if(params[:Skill].present?)
			skillArray = params[:Skill].split(',')
		end
		if(skillArray.empty?)
			skillArray = [1,2,3,4,5,6]
		end
		#Creates the list of recipes if required, must match all materials give
		@recipes = []
		if(nameArray.length > 1 && params[:any] != "any")
			chk = true
			@recipes = Recipe.joins(:input).where("md_cr_input.Name IN (?) AND Skill IN (?)", nameArray, skillArray).having('COUNT(Recipe_ID) >= ?', nameArray.length).group("md_cr_recipes.id")
		end
		#creates the list of recipes if they don't have to match all or the above
		if(@recipes.empty?)
			@recipes = Recipe.joins(:input).where("md_cr_input.Name IN (?)", nameArray).group(:id)
			if(chk)
				flash[:notice] = "No matches found for all. Displaying matches for any."
			end
		end

	end
end
