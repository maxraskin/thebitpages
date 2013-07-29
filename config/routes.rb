Bitpages::Application.routes.draw do
  
  mount Messaging::Engine => "/messaging"
  devise_for :messaging_users
  devise_for :admin_users, ActiveAdmin::Devise.config

  authenticated :user do
    root :to => "dashboard#index"
  end

  authenticated :merchant do
    root :to => "dashboard#index"
  end

  authenticated :merchant_profile do
    root :to => "dashboard#index"
  end

  root :to => "home#index"

  devise_for :merchants
  devise_for :users
  devise_for :merchant_profiles, :controllers => { :registrations => "merchant_profiles" }
  # devise_for :merchant_profiles

  resources :profile

  #######
  resources :merchant_profiles
  
  resources :merchants
  resources :merchant_friendships
  resources :merchant_user_friendships

  resources :users
  resources :user_friendships
  resources :user_merchant_friendships

  match '/map', :to => "dashboard#map"
  match '/search', :to => "dashboard#search"
  match '/network', :to => "dashboard#network"

  match '/about', :to => "home#about"
  match '/contact', :to => "home#contact"
  match '/help', :to => "home#help"

  resources :user_submissions
  
  resources :messages

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
      delete :destroy_trash
    end
  end

  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
