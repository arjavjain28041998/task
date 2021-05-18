Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
    
  }
  
  resources :users do
    member do
      get :confirm_email
    end
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
