Rails.application.routes.draw do
  root "books#index"
  resources :books

  #會員系統
  resource :users, except: [:destroy, :new] do 
    get :sign_up
    get :sign_in
  end

  #登入 create
  #登出 destory
  resource :sessions, only:[:create, :destroy]
end
