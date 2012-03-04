CubeComps::Application.routes.draw do
  devise_for :users

  resources :competitions do
    resources :entries, :only => [:index, :new, :create, :edit, :update]
    resources :events , :only => [:new, :create]
  end

  resources :events, :only => [] do
    resources :rounds , :only => [:edit, :update]
    resources :results, :only => [:index, :edit, :update]
  end

  root :to => "competitions#index"
end
