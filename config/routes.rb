Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update] do
      get 'show' => 'likes#show'
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :posts, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
      resources :likes, only: [:show, :create, :destroy]
    end
  end
end