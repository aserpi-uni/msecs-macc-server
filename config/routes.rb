Rails.application.routes.draw do
  devise_for :workers
  devise_for :admins
  resources :workers
  resources :admins

  devise_scope :admin do
    authenticated :admin do
      root 'control_panel#index', as: :admins_root
    end
  end

  devise_scope :worker do
    authenticated :worker do
      root to: 'workers#show_self', as: :workers_root
    end

    unauthenticated :worker do
      devise_scope :admin do
        # Authenticated admins already matched: no unauthenticated :admin
        root 'devise/sessions#new'
      end
    end
  end

  resources :workspaces do
    member do
      get 'edit_workers'
      post 'update_workers'
      patch 'transfer_supervision'
    end
  end
end
