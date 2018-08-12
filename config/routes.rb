Rails.application.routes.draw do
  get 'home/free'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'freepost' => "home#freepost"
  post 'freecomment' => "home#freecomment"

  get 'freelike/:freepost_id' => "post#freelike"
  get 'freeunlike/:freepost_id' => "post#freeunlike"

  get 'freedislike/:freepost_id' => "post#freedislike"
  get 'freeundislike/:freepost_id' => "post#freeundislike"

end
