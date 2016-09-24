Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Static Pages
  root 'pages#home'
  get '/lecture' => "pages#lecture"
  get '/study'   => "pages#study"

  # Devise routes
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
  	get "/login" => "devise/sessions#new"
  	get "/signup" => "devise/registrations#new"
	end

  # Users resource
	resources :users, only: [:index, :show, :edit, :update, :destroy] do
		get 'lectures', on: :member
    get 'quizzes', on: :member
	end

  # ETC.
	resources :lectures, only: [:create, :destroy]
	resources :enrollments, only: [:create, :destroy]
  resources :quizzes, only: [:index, :create, :destroy]

	delete 'enrollment_path' => "enrollments#destroy"
end
