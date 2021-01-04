Rails.application.routes.draw do
  
  #Studios
  get "/studios", to: "studios#index"
end
