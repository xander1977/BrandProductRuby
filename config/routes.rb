Rails.application.routes.draw do
  get 'products/index'
  get 'products/create'
  post 'products/create'
  get 'products/read'
  get 'products/update'
  post 'products/update'
  get 'products/delete'
  get 'brands/index'
  get 'brands/create'
  post 'brands/create'
  get 'brands/read'
  get 'brands/update'
  post 'brands/update'
  get 'brands/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
