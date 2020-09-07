Rails.application.routes.draw do
  devise_for :admins
  devise_for :workers, controllers: { sessions: 'workers/sessions' }

  resources :admins

  resources :clients do
    member do
      get 'edit_workspaces'
      post 'update_workspaces'
    end
  end

  resources :projects do
    get 'show_cost', on: :member

    resources :activities, except: :index do
      get 'show_cost', on: :member

      resources :subactivities, except: :index
    end
  end

  resources :workers do
    patch 'update_master', on: :member
  end

  resources :workingschedules

  resources :workspaces do
    member do
      get 'get_workers'
      get 'edit_clients'
      get 'edit_workers'
      post 'update_clients'
      post 'update_workers'
      patch 'transfer_supervision'
    end
  end

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

  get 'google_oauth/id', to: 'google_sign_in#id'
  post 'google_oauth/sign_in', to: 'google_sign_in#sign_in'

  get 'control_panel', to: 'control_panel#index'
end
