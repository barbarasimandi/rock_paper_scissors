Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/welcome', to: "games#welcome"
    end
  end
end
