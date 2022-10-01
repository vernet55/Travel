Rails.application.routes.draw do

  namespace :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit/:id' => 'customers#edit', as: 'edit_customer'
    patch 'customers' => 'customers#update', as: 'update_customer'

    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
     resource :likes, only: [:create, :destroy]
     resources :comments, only: [:create, :destroy]
    end
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
