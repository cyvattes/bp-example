Rails.application.routes.draw do
  root to: 'visitors#index'
  post 'visitors/contact', to: 'visitors#contact'
end
