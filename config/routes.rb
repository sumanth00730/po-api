Rails.application.routes.draw do
<<<<<<< HEAD
  

  namespace :api do
    namespace :v1 do 
      resources :purchaseorders
    end
  end
=======
  resources :purchaseorders
  delete '/purchaseorders', to: 'purchaseorders#destroy_all'
>>>>>>> 86959c8cedf3818e9442ab53dddc51048b30c293
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
