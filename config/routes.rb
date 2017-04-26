Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api, module: "api" do
  	resources :todo_lists do
  		resources :todo_items, only: [:show, :index, :create, :update, :destroy]
  		end
  end
end
