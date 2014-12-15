Betip::Application.routes.draw do
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout'}

  get '/betip/*path'=> "static#index"
  
  resources :type_of_bets

  match 'predictions/fixtures_this_week' => 'predictions#fixtures_this_week'
  
  resources :predictions


  resources :results

  # match 'users/profile_type_of_bet' => 'users#profile_type_of_bet'

  match 'users/profile_predictions' => 'users#profile_predictions'

  match 'users/profile_tips' => 'users#profile_tips'

  resources :tips

  match 'users/top_three' => 'users#top_three'

  match 'users/followed_tips' => 'users#followed_tips'

  match 'users/users_profile/:id' => 'users#users_profile'

  resources :users, :only => [:show, :index]

  match 'user_connections/subscription_requests' => 'user_connections#subscription_requests'

  resources :user_connections
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
  root :to => 'static#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
