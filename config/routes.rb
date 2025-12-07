Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :quizzes, only: [:index, :show] do
    member do
       get :play
       post :submit
     end
  end

  root "quizzes#index"
end
