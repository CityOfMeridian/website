Rails.application.routes.draw do
  constraints (-> (req) { ["meridiantx.xyz", "lvh.me"].include? req.domain }) do
    constraints subdomain: 'www' do

      root to: "pages#home"

      get "/404" => "errors#not_found"
      get "/500" => "errors#internal_error"
      get "/privacy_policy" => "application#privacy_policy"
      get "/terms_and_conditions" => "application#terms_and_conditions"
      get "/visit" => "visitor/application#index"
      get "community_organizations" => "organizations#community_organizations", as: "community_organizations"
      get "pages/library" => "pages#library"
      get "pages/calendar" => "pages#calendar"
      get "pages/:slug" => "pages#show", as: "pages_slug"

      get "/history" => "application#history"
      
      resources :public_notices, only: [:index, :show] do
        get :noticeable
      end

      resources :news_items, only: [:index, :show]
      resources :events, only: [:index, :show]
      resources :contacts, only: [:create, :new]

      resources :organizations, only: [:show, :community_organizations] do
        resources :members, only: [:index]
      end

      namespace :admin do
        resources :pages, only: [:new, :create, :destroy], param: :id
        resources :roles
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
        get "/" => "organizations#index"
        # TODO: CRUD for organization_types and contacts
        # resources :organization_types
        # resources :contacts
      end
      # mount Fae below your admin namespec
      mount Fae::Engine => '/admin'
    end

    constraints subdomain: "visit" do
      root to: "visitor/application#index"
      match "/*path" => redirect("/", subdomain: "visit"), via: :all
    end
    
    constraints subdomain: "" do
      root to: redirect("/", subdomain: "www")
      match '/*path' =>  redirect("/", subdomain: "www"), via: :all
    end
  end

  root to: "coming_soon#index"
  match "/*path" => "coming_soon#index", via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
