Rails.application.routes.draw do
  devise_for :users
  root to: 'questions#index'
  
  resources :questions do
    resources :comments do
      member do
        post 'best_answer'
        post 'best_answer_reset'
      end
    end

    collection do
      get 'search'
    end
  end
end
