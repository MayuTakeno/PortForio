Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
  end
  root to: 'top_pages#top'

  namespace :admin do
    root to: 'notices#index'
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
    resources :products
    # get 'products/new'
    # get 'products/index'
    # get 'products/edit'
    # get 'products/show'
    resources :blogs, only: [:show, :index, :destroy]
    # get 'blogs/index'
    # get 'blogs/show'
  end

  namespace :public do
    # publicのルートパス
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    resources :notices, except: [:new, :create, :edit]
    # get 'notices/index'
    # get 'notices/show'
    # get 'notices/edit'
    resources :employees, except: [:index, :new, :create]
    # get 'employees/show'
    # get 'employees/edit'
    resources :blogs
    resources :events, only: [:index, :show]
    resources :products, only: [:index, :show]
    post "chats/:id" => "chats#show"
    resources :chats, only: [:index, :create, :show, :destroy] do
      resources :chat_messages, only: [:create, :destroy]
    end
  end
  #社員用URL
  devise_for :employees, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用URL
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
