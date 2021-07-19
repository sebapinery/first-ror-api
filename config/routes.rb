Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # get 'get_users', action: :show_users, controller: :users
      # get 'show_user_by_id', action: :show_user_by_id, controller: :users
      # post 'add_user', action: :add_user, controller: :users
      # put 'update_user', action: :update_user, controller: :users
      # delete 'delete_user', action: :delete_user, controller: :users

      get '/', action: :show_users, controller: :users
      get '/show_user', action: :show_user_by_id, controller: :users
      post '/', action: :add_user, controller: :users
      put '/', action: :update_user, controller: :users
      delete '/', action: :delete_user, controller: :users
    end
  end
end
