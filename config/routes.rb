Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/play', to: "games#play"
    end
  end
end
