Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  get 'academic_record', to: 'pages#academic_record'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
    resources :units, only: [:new, :create]
  end
  resources :enrollments, only: :index
  resources :units, only: [:show, :edit, :update, :destroy] do
    resources :activities, only: [:new, :create]
    resources :activities, only: [] do
      collection do
        get ':type', to: 'activities#get_by_type', as: :get_by_type
      end
    end
  end
  resources :activities, except: [:new, :create,:index] do
    resources :solutions, only: :create
  end
  resources :solutions, only: [:index, :show, :update]
end
