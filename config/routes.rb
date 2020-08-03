Rails.application.routes.draw do
  get "/flights/:id", to: "flights#show", as: "flights"
  get "/passengers/:id", to: "passengers#show", as: "passengers"
end
