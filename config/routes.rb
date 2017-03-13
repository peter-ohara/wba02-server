Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :vouchers
  resources :purchases
  resources :answers
  resources :downvotes
  resources :upvotes
  resources :comments
  resources :users
  resources :multiple_choice_questions
  resources :fill_in_questions
  resources :essay_questions
  resources :headers
  resources :quizzes
  resources :offerings
  resources :courses
  resources :programmes
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
