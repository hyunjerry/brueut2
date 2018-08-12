Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/free'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'freepost' => "home#freepost"
  post 'freecomment' => "home#freecomment"

  get '/freenew' => 'home#freenew'
  get '/freeindex' => 'home#freeindex'
  get '/freeshow/:freepost_id' => 'home#freeshow'
  post '/freedestroy/:freepost_id' => 'home#freedestroy'

  post '/freeupdate/:freepost_id' => 'home#freeupdate'
  get '/freeedit/:freepost_id' => 'home#freeedit'

  post 'freelike/:freepost_id' => "post#freelike"
  post 'freeunlike/:freepost_id' => "post#freeunlike"

  post 'freedislike/:freepost_id' => "post#freedislike"
  post 'freeundislike/:freepost_id' => "post#freeundislike"

  #google sign in
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'home', to: 'home#free'

end
