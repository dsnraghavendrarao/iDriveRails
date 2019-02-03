Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/authentication" => "authentication#login",defaults: {format: :json}
  post "/create" => "users#create",defaults: {format: :json}
  get  "/todos" => "todos#todos",defaults: {format: :json}
end
