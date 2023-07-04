Rails.application.routes.draw do

  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'homes/top'
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
    get 'orders/show'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw'
    resource :customers, only: [:update]

    resources :items, only: [:index, :show]

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    post 'orders/check' => 'orders#check'
    get 'orders/thanks' => 'orders#thanks'
    resources :orders, only: [:new, :create, :index, :show]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
