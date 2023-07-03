Rails.application.routes.draw do

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
    get '/customers/sign_up' => 'registrations#new'
    get '/customers/sign_in' => 'sessions#new'

    resources :customers, only: [:show, :edit, :update]
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw'
    get 
    get 

    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/check' => 'orders#check'
    get 'orders/thanks' => 'orders#thanks'

    get 'cart_items/index'

  end

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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
