Rails.application.routes.draw do

  namespace :public do
    get 'customers/:id' => 'customers#show'
    get 'customers/edit/:id' => 'customers#edit', as: 'edit_customer'
    patch 'customers' => 'customers#update', as: 'update_customer'
    delete 'customers/:id' => 'customers#destroy', as: 'destroy_customer'

    resources :customers do
      get :follows
      get :followers
      resource :relationships, only: [:create, :destroy]
    end



    resources :posts do
     get :search, on: :collection
     resource :likes, only: [:create, :destroy]
     resources :comments, only: [:create, :destroy, :edit, :update]
    end
  end

  namespace :admin do

  root :to =>"homes#top"
  end

  namespace :admin do
    get 'customers/:id/index' => 'customers#index', as: 'index_customer'
    get 'customers/:id' => 'customers#show', as: 'show_customer'
    get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
    delete 'customers/:id' => 'customers#destroy', as: 'destroy_customer'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  get 'home/index'
  get 'home/authentication'

  root to: "homes#home"


end
