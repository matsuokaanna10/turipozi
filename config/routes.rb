Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:index, :edit, :update]
    resources :posts, only: [:index, :new, :show, :create, :edit, :update, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
