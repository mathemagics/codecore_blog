Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about' => 'home#about', as: :about

  resources :users, only: [:new, :create, :edit, :update] do
    resources :favourites, only: :index
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :posts do
    resources :comments do
    end
    resources :favourites, only: [:create, :destroy, :index]
  end



end
