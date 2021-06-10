Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }
  
  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
    resources :lists, only:[:show, :edit, :destroy] do
      resources :list_comments, only:[:destroy]
    end
  end
  
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
    get "/users/:id/unsubscribe" => "users#unsubscribe", as: "unsubscribe"
    patch "/users/:id/withdraw" => "users#withdraw", as: "withdraw"
    get "/my_calendar" => "events#my_calendar", as: "my_calendar"
    resources :events, only:[:new, :create, :index, :show, :edit, :update, :destroy]
    resources :users, only:[:show, :edit, :update] do
      resource :relationships, only:[:create, :destroy]
      get "/relationship/followings" => "relationships#followings", as: "followings"
      get "/relationship/followers" => "relationships#followers", as: "followers"
    end
    resources :lists do
      resources :list_comments, only:[:create, :destroy]
      resource :favorites, only:[:create, :destroy]
    end
  end
end