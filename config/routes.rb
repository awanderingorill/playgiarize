Plagiarize::Application.routes.draw do

  get '/' => 'pieces#new'
  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
  get '/error' => 'session#prompt'
  get '/about' => 'session#about'

  resources :users
  resources :pieces

end
#== Route Map
# Generated on 23 Oct 2013 18:37
#
#     signup GET    /signup(.:format)          users#new
#      login GET    /login(.:format)           session#new
#            POST   /login(.:format)           session#create
#     logout GET    /logout(.:format)          session#destroy
#      error GET    /error(.:format)           session#prompt
#      users GET    /users(.:format)           users#index
#            POST   /users(.:format)           users#create
#   new_user GET    /users/new(.:format)       users#new
#  edit_user GET    /users/:id/edit(.:format)  users#edit
#       user GET    /users/:id(.:format)       users#show
#            PUT    /users/:id(.:format)       users#update
#            DELETE /users/:id(.:format)       users#destroy
#     pieces GET    /pieces(.:format)          pieces#index
#            POST   /pieces(.:format)          pieces#create
#  new_piece GET    /pieces/new(.:format)      pieces#new
# edit_piece GET    /pieces/:id/edit(.:format) pieces#edit
#      piece GET    /pieces/:id(.:format)      pieces#show
#            PUT    /pieces/:id(.:format)      pieces#update
#            DELETE /pieces/:id(.:format)      pieces#destroy
