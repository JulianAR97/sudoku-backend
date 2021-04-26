Rails.application.routes.draw do
  resources :users, except: %i[index show update destroy] do
    resources :stats, only: %i[index]
    resources :scores, only: %i[index create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
