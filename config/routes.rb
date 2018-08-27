Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'companies#index'
  resources :companies do 
  	collection do
  		get 'humane'
  		get 'green'
  		get 'fair_trade'
  	end
  end
  
  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  	get 'signup', to: 'devise/registrations#new'
	end
end
