require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'

  namespace :api do
    scope :v1 do

      get 'recent_items', to: 'general#recent_items'

    end
  end
end
