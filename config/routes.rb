Rails.application.routes.draw do
  resources :purchaseorders
  delete '/purchaseorders', to: 'purchaseorders#destroy_all'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
