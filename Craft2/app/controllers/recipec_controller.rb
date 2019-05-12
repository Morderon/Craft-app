class RecipecController < ApplicationController
	def index
		#@recipes = Recipe.all
	end
	def show
		begin
			@recipe = Recipe.find(params[:ID])
			@inputs = @recipe.input
                        @outputs = @recipe.output
		rescue => e
			flash[:notice] = "Invalid ID Supplied"
			redirect_to skillindex_url
		end
	end
	def indexskill
		@skill1 = Recipe.where('skill=1').count
		@skill2 = Recipe.where('skill=2').count
		@skill3 = Recipe.where('skill=3').count
		@skill4 = Recipe.where('skill=4').count
		@skill5 = Recipe.where('skill=5').count
		@skill6 = Recipe.where('skill=6').count

	end
	def showskill
		@recipes = Recipe.where("Skill = ?", params[:Skill])
	end
end
