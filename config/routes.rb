Rails.application.routes.draw do
  get 'home/free'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'freepost' => "home#freepost"
  post 'freecomment' => "home#freecomment"

end
