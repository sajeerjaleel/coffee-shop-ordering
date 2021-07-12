Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "orders#new"
  resources :orders
  get '/complete/:id', to: 'orders#complete', as: 'complete_order'
end
