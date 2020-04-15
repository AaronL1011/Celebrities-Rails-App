Rails.application.routes.draw do
  get "/", to: "celebrities#index", as: :home
  get "/:name", to: "celebrities#show", as: :show
  post "/", to: "celebrities#create"
  put "/:name", to: "celebrities#update"
  patch "/:name", to: "celebrities#update"
  delete "/:name", to: "celebrities#destroy"
end
