Rails.application.routes.draw do
    get '/recipes' => 'recipes#index'
    get '/recipes/skill' => 'recipes#indexskill', as: :skillindex
    get '/recipes/skill/:Skill' => 'recipes#showskill', as: :skill
    get '/recipes/input/:Name(/skill/:Skill)(/:any)'    => 'inputs#show', as: :input
    #get '/recipes/input/:Name'    => 'inputs#show', as: :input
    get '/recipes/:ID' => 'recipes#show', as: :recipe
    get '/json' => 'json#index', format: 'json'
    get '*path' => 'recipes#index'
    root to: 'recipes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
