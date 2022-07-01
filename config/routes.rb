Rails.application.routes.draw do

  root to: 'top_pages#top'

  namespace :public do
    # publicのルートパス
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    resources :notices, except: [:new, :create]
    # get 'notices/index'
    # get 'notices/show'
    # get 'notices/edit'
    resources :employees, except: [:index, :new, :create]
    # get 'employees/show'
    # get 'employees/edit'
    resources :blogs
    resources :events, only: [:index, :show]
    resources :products, only: [:index, :show]
    get 'qa_chat/:id' => 'qa_chats#show', as: 'qa_chat'
    post 'qa_chat/:id' => 'qa_chats#show'
    resources :qa_chats, only: [:create]
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
