Rails.application.routes.draw do
  root to: "application#index"
  get "/index" => "application#index"

  get "/edc" => "application#edc"
  get "/calendar" => "application#calendar"
  get "/city_council" => "application#council"

  namespace :admin do
    resources :agendas
    resources :news_items
    resources :events
    resources :minutes
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
