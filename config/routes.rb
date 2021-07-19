Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/', action: :show_users, controller: :users
      get '/show_user', action: :show_user_by_id, controller: :users
      post '/', action: :add_user, controller: :users
      put '/', action: :update_user, controller: :users
      delete '/', action: :delete_user, controller: :users
    end
  end
end
