Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  scope module: :public do
    root "homes#top"
    get "/about" => "homes#about"
  end
end