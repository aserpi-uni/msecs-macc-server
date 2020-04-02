Rails.application.routes.draw do
  devise_for :admins
  devise_for :workers, controllers: { sessions: 'workers/sessions' }

  resources :admins
  resources :workers

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

  resources :clients do
    member do
      get 'edit_workspaces'
      post 'update_workspaces'
    end
  end

  resources :workspaces do
    member do
      get 'edit_workers'
      post 'update_workers'
      patch 'transfer_supervision'
    end
  end

  get 'google_oauth/id', to: 'google_sign_in#id'
  post 'google_oauth/sign_in', to: 'google_sign_in#sign_in'
end
