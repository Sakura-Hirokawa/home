Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }
  
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
  end
end