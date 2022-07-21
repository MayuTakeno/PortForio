Rails.application.routes.draw do

  namespace :admin do
    root to: 'employees#index'
    get "search_blog" => 'searches#search_blogs'
    get "search_notice" => 'searches#search_notices'
    get "search_event" => 'searches#search_events'
    get "search_product" => 'searches#search_products'
    resources :employees, except: [:new, :create]
    # get 'employees/index'
    # get 'employees/edit'
    # get 'employees/show'
    resources :notices
    # get 'notices/new'
    # get 'notices/index'
    # get 'notices/show'
    # get 'notices/edit'
    resources :events
    # get 'events/new'
    # get 'events/index'
    # get 'events/show'
    # get 'events/edit'
    # get 'products/new'
    # get 'products/index'
    # get 'products/edit'
    # get 'products/show'
    resources :chats, only: [:index, :show, :destroy] do
      resources :chat_messages, only: [:destroy]
    end
    resources :blogs, only: [:show, :index, :destroy]
    # get 'blogs/index'
    # get 'blogs/show'
    resources :products
    resources :tags, except: [:show]
    # get 'tags/new'
    resources :orders, only: [:show, :update, :index, :destroy]
    resources :product_orders, only: [:update]
    # get 'orders/show'
  end

  namespace :public do
    # publicのルートパス
    root to: 'homes#top'
    # aboutページの名前付きルーティング
    get 'homes/about' => 'homes#about', as: 'about'

    # 検索用ルーティング
    get "search_blog" => 'searches#search_blogs'
    get "search_notice" => 'searches#search_notices'
    get "search_chat" => 'searches#search_chats'
    get "search_event" => 'searches#search_events'
    get "search_event_date" => 'searches#search_event_dates'
    get "search_product" => 'searches#search_products'

    resources :notices, except: [:new, :create, :edit]
    # get 'notices/index'
    # get 'notices/show'
    # get 'notices/edit'
    resources :employees, except: [:index, :new]
    # get 'employees/show'
    # get 'employees/edit'
    resources :blogs do
      resource :favorites, only: [:create, :destroy]
    end
    resources :events, only: [:index, :show]
    post "chats/:id" => "chats#show"
    resources :chats, only: [:index, :create, :show, :destroy] do
      resources :chat_messages, only: [:create, :destroy]
    end
    resources :products, only: [:index, :show]
    get 'orders/:id/confirm/' => 'orders#confirm', as: "confirm"
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, except: [:edit, :update]
    # get 'orders/new'
    # get 'orders/index'
    # get 'orders/show'
    delete 'cart_items/destroy_all'
    resources :cart_items, except: [:new, :show, :edit]
    # get 'cart_items/index'
    devise_scope :employee do
      post 'employees/guest_sign_in', to: 'employees/sessions#guest_sign_in'
    end
  end
  #社員用URL
  devise_for :employees, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # sign_upのsubmitでnilを送った時のルーティングエラー回避
  devise_scope :employee do
    get '/employees', to: redirect("/employees/sign_up")
  end


  #管理者用URL
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top_pages#top'
end
