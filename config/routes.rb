Rails.application.routes.draw do
	root 'clicks#new'

	resources :clicks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
