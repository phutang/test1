Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get 'report1', to: 'home#report1'
  get 'report2', to: 'home#report2'
end
