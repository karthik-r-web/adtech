Rails.application.routes.draw do
  resources :products do
    collection do
    resources :variants
  end
  end
  resources :variants
  resources :doctors
  resources :patients
  resources :appointments
  root "appointments#index"
  #
  # resources :products do
  #   member do
  #   resources :variants
  #   end
  #   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
