Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get "/about"=>"homes#about"
    resources :products, only: [:index, :show]
    resource :customers,only: [] do
      get "my_page"=>"customers#show"
      get "information/edit"=>"customers#edit"
      patch "information"=>"customers#update"
      get "unsubscribe"=>"customers#unsubscribe"
      patch "withdraw"=>"customers#withdraw"
    end

    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        delete "all_destroy"=>"cart_items#all_destroy"
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
          collection do
            post "confirm"=>"orders#confirm"
            get "complete"=>"orders#complete"
          end
        end
        resources :delivery_addresses, except: [:new, :show]
      end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
      root to: "homes#top" 
      resources :products, except: [:destroy]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only: [:index, :show, :edit, :update]
      resources :orders, only: [:show, :update] do
        resources :order_details, only: [:update]
      end
    end


end