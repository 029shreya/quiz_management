Rails.application.routes.draw do
  resources :quizzes, only: [:index, :show] do
    post :submit, on: :member
  end

  root "quizzes#index"
end
