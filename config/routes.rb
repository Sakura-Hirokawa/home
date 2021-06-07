Rails.application.routes.draw do
  devise_for :admin, controller: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }
  
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    get "/users/unsubscribe" => "users#unsubscribe"
    patch "/users/withdraw" => "users#withdraw"
    resources :users, only:[:show, :edit, :update]
    resources :lists do
      resources :list_comments, only:[:create, :destroy]
      resource :favorites, only:[:create, :destroy]
    end
  end
end