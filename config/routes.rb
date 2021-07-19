Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      post 'add_user', action: :add_user, controller: :users
      get 'get_users', action: :get_users, controller: :users
    end
  end
end
