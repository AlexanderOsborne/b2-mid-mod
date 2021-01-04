Rails.application.routes.draw do
  
  #Studios
  get "/studios", to: "studios#index"

  #Movies
  get "/movies/:id", to: "movies#show", as: :movies_show
end
