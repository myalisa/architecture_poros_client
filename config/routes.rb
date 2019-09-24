Rails.application.routes.draw do
  get '/' => 'client/buildings#index'
  
  namespace :client do
    get '/buildings' => 'buildings#index'
    get '/buildings/new' => 'buildings#new'
    get '/buildings/:id' => 'buildings#show'
    post '/buildings' => 'buildings#create'
    get '/buildings/:id/edit' => 'buildings#edit'
    patch '/buildings/:id' => 'buildings#update'
    delete '/buildings/:id' => 'buildings#destroy'
  end
end
