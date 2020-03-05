Rails.application.routes.draw do
  devise_for :admins
  resources :admins

  devise_scope :admin do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
