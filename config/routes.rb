Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post :verify, to: "users#verify"
    end
  end
end
