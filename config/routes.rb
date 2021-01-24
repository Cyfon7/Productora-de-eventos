Rails.application.routes.draw do
  get 'concert/new'
  get 'concert/create'
  get 'concert/show'
  get 'concert/update'
  get 'concert/destroy'
  get 'group/index'
  get 'group/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
