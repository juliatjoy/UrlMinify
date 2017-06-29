Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get ':slug' => 'links#get_link'

  resources :links, only: :create
end
