Forum::Application.routes.draw do
  devise_for :users

  resources :profiles, only: [:index, :show]

  resources :sections, only: [:index, :show] do
    resources :posts
  end

  resources :posts do
    resources :replies
  end

  namespace :admin do
    resources :sections
  end

  root to: "sections#index"
end
