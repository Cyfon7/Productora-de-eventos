Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :groups do
    resources :crews
  end

  resources :concerts

  root "groups#index"
end
