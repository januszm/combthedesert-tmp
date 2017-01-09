Rails.application.routes.draw do

  resources :pages, only: [:index, :show] do
  end

  root to: 'pages#index'

end
