Rails.application.routes.draw do


  post 'create_multiple_vouchers', to: 'vouchers#create_multiple_vouchers'

  namespace :android_v1 do
    resources :main_screen,
              :quiz_overview_screen,
              :take_quiz_screen,
              :multiple_choice_question_screen,
              :fill_in_question_screen,
              :essay_question_screen,
              :header_screen,
              :comments,
              :store_screen,
              :upvotes,
              :users,
              :store_screen,
              :buy_tests_screen

    post 'load_voucher', to: 'load_voucher_screen#load_voucher'
    post 'buy_tests', to: 'buy_tests_screen#buy_tests'
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
