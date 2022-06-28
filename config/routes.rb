Rails.application.routes.draw do

  namespace :public do
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    # homesのルーティング
    # get 'homes/top'
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
