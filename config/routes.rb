ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'destroyers'
  map.logout 'logout', :controller => "user_sessions", :action => "destroy"
  map.login 'login', :controller => "user_sessions", :action => "new"
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :password_resets, :only => [:new, :create, :edit, :update]
  
  map.register 'register', :controller => 'users', :action => 'new'
  map.resources :users, :only => [:new, :create]

  map.resources :destroyers, :only => [:index, :show]
  map.resources :favorites

  map.namespace :admin do |admin|
    admin.resources :favorites, :collection => { :create => :post }
    admin.resources :roles
    admin.resources :users
    admin.resources :destroyers
    admin.root :controller => 'admin', :action => 'index'
  end

  map.namespace :members do |members|
    members.resources :favorites, :collection => { :create => :post }
    members.resources :destroyers
    members.resources :user, :only => [:show, :edit, :update]
    members.root :controller => 'members', :action => 'index'
  end

end
