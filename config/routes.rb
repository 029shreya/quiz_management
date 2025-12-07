Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :quizzes, only: [:index, :show] do
    post :submit, on: :member
  end

  root "quizzes#index"
end
