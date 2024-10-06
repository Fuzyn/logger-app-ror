Rails.application.routes.draw do
  # get 'logs/create'
  # resources :logs, only: [:index, :create]
  # get 'next_logs', to: 'logs#next_logs'
  #
  # match '*path', to: redirect('/logs'), via: :all
  resources :logs, only: [:index, :create]
  match '*path', to: redirect('/logs'), via: :all
end
