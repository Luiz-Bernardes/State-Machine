Rails.application.routes.draw do
  resources :documents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'change/:id', to: 'documents#change', as: 'change'
end
