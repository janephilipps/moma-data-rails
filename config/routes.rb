Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/data/index", to: "data#index"
  get "/data/chart", :defaults => { :format => "json" }
end
