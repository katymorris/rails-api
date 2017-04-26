Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api, module: "api" do
  	resources :todo_lists
  end
end
