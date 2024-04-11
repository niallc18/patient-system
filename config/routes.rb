Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get "up" => "rails/health#show", as: :rails_health_check

  resources :patients do
    collection do
      get 'patient_stats'
    end
  end  
end
