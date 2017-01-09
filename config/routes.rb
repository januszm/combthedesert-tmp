Rails.application.routes.draw do

  resources :pages, only: [:index, :show] do
    collection do
      post 'scrape_url'
    end
  end

  root to: 'pages#index'

end
