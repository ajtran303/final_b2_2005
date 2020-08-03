Rails.application.routes.draw do
  get "/flights/:id", to: "flights#show", as: "flights"
  get "/passengers/:id", to: "passengers#show", as: "passengers"
  post "/passengers/:passenger_id/flights", to: "flight_passengers#create"
  get "/", to: "welcome#index"
end
