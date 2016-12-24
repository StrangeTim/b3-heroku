Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers:  {
    registrations: 'users/registrations', sessions: 'users/sessions'
  }
  root 'home#show'
  get '/login', to: redirect('users/sign_in')
  resources :home, only: [:show, :edit, :update]
  resources :about, only: [:show, :edit, :update]
  resources :artists do
    resources :artworks, except: [:index]
  end
  get '/about', to: 'about#show'
end
