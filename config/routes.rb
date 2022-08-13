Rails.application.routes.draw do
  root "books#index"
  resources :books

  #會員系統
  resource :users, except: [:destroy, :new] do 
    get :sign_up
    get :sign_in
  end
end
