class JsonController < ApplicationController
  caches_action :index, expires_in: 1.hour

  def index
    # Load all recipes and preload relational models
    @all = Recipe
      .includes(:category, :output, :input, :feat, :skill)
      .joins("INNER JOIN md_cr_category AS c ON c.id=md_cr_recipes.category")
      .where("Settings & 1 != 1")
      .references(:category, :output, :input, :feat, :skill)

    @structured = {
      'byCraft' => {},
      'byID' => {},
    }

    @all.each do |recipe|
      # Handle creating or adding nested hashes
      if !@structured['byCraft'].has_key? recipe.Skill
        @structured['byCraft'][recipe.Skill] = { 'byID' => {}, 'byCategory' => {} }
      end

      if !@structured['byCraft'][recipe.Skill]['byCategory'].has_key? recipe.category.name
        @structured['byCraft'][recipe.Skill]['byCategory'][recipe.category.name] = {}
      end

      # Insert recipe into nested and root hashes
      @structured['byID'].store(recipe.ID, recipe)
      @structured['byCraft'][recipe.Skill]['byID'].store(recipe.ID, recipe)
      @structured['byCraft'][recipe.Skill]['byCategory'][recipe.category.name].store(recipe.ID, recipe)
    end

    render json: @structured.to_json(:include => [
        {:category => {:only => :name}},
        {:output => {:only => [:Name, :Qty]}},
        {:input => {:only => [:Name, :Qty]}},
        {:feat => {:only => :Feat}},
        {:skill => {:only => [:Skill, :Rank]}}
      ])
  end
end
