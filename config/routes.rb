Rails.application.routes.draw do
  root 'studios#index'

  get '/studios', to: 'studios#index'
end
