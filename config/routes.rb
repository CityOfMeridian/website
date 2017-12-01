Rails.application.routes.draw do
  constraints subdomain: ['www'] do

    root to: "application#index"
    get "/index" => "application#index"

    get "/edc" => "application#edc"
    get "/calendar" => "application#calendar"
    get "/404" => "errors#not_found"
    get "/500" => "errors#internal_error"
    get "/edc" => "application#edc"
    get "/calendar" => "application#calendar"
    get "/visit" => "application#visit"
    get "/history" => "application#history"
    get "/dining" => "application#dining"
    get "/shopping" => "application#shopping"
    
    resources :public_notices, only: [:index, :show] do
      get :noticeable
    end

    resources :news_items, only: [:index, :show]
    resources :events, only: [:index, :show]

    resources :organizations, only: [:show] do
      resources :members, only: [:index]
    end

    namespace :admin do
      resources :public_notices
      resources :members
      resources :meetings
      resources :organizations do
        resources :meetings
        resources :places
      end
      get '/login' => 'sessions#new'
      resources :agendas
      resources :news_items
      resources :events
      resources :places
    end
    # mount Fae below your admin namespec
    mount Fae::Engine => '/admin'
  end

  constraints subdomain: "visit" do
    get "/" => "vistors#index"
  end
  
  constraints subdomain: "" do
    root to: redirect("/", subdomain: "www")
    match '/*path' =>  redirect("/", subdomain: "www"), via: :all
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
