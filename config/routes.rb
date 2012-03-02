CubeComps::Application.routes.draw do
  devise_for :users

  resources :competitions do
    resources :entries, :only => [:new, :create, :edit, :update]
    resources :events , :only => [:new, :create]
  end

  resources :events do
    resources :results
  end

  root :to => "competitions#index"
end
