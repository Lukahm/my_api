Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get     "/animals",     to: "animals#index"
      post    "/animals",     to: "animals#create"
      get     "/animals/:id", to: "animals#show"
      put     "/animals/:id", to: "animals#update"
      delete  "/animals/:id", to: "animals#destroy"
    end
  end

end
