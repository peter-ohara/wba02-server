Rails.application.routes.draw do

  namespace :android_v1 do
    resources :main_screen,
              :quiz_overview_screen,
              :take_quiz_screen,
              :multiple_choice_question_screen,
              :fill_in_question_screen,
              :essay_question_screen,
              :header_screen,
              :comments,
              :store_screen
  end

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
