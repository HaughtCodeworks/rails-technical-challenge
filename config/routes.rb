Rails.application.routes.draw do
  resources :students
  resources :field_trips

  root to: 'field_trips#index'
end
