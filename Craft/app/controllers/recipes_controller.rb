class RecipesController < ApplicationController
    def index
        #@recipes = Recipe.all
    end
    #Shows the individual recipe page
    def show
        begin
            @recipe = Recipe.find(params[:ID])
            @inputs = @recipe.input
            @outputs = @recipe.output
            @feats = @recipe.feat
            @skills = @recipe.skill
        rescue => e
            flash[:notice] = "Invalid ID Supplied"
            redirect_to skillindex_url
        end
    end
    #Shows the general skill page, should perhaps be moved into a single array
    def indexskill
        @skill1 = Recipe.where('skill=1').count
        @skill2 = Recipe.where('skill=2').count
        @skill3 = Recipe.where('skill=3').count
        @skill4 = Recipe.where('skill=4').count
        @skill5 = Recipe.where('skill=5').count
        @skill6 = Recipe.where('skill=6').count
    end
    #Shows all recipes for a specific skill
    def showskill
        @recipes = Recipe.where("Skill = ?", params[:Skill])
    end
end
