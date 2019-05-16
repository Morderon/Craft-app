Rails.application.routes.draw do
	get '/recipes' => 'recipec#index'
	get '/recipes/skill' => 'recipec#indexskill', as: :skillindex
	get '/recipes/skill/:Skill' => 'recipec#showskill', as: :skill
	get '/recipes/input/:Name(/skill/:Skill)(/:any)'    => 'inputs#show', as: :input
	#get '/recipes/input/:Name'    => 'inputs#show', as: :input
	get '/recipes/:ID' => 'recipec#show', as: :recipe
  get '/json' => 'json#index'
	get '*path' => 'recipec#index'
  root to: 'recipec#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
