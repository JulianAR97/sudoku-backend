Rails.application.routes.draw do
  resources :users, except: %i[index show create update destroy] do
    resources :scores, only: %i[index create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
