BIIndex::Application.routes.draw do
  resources :reports do
      collection do
      match 'search' => 'reports#search', :via => [:get, :post], :as => :search
    end
  end
#  match "listview_report", :controller=>"reports", :action=>"listview_report"
  match "listview_report"=>"reports#listview_report"
  match "export_to_pdf"=>"reports#export_to_pdf"
  post  "export_to_pdf"=>"reports#export_to_pdf"

  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
  get 'signup' => 'users#new', as: :signup
  get 'account' => 'users#edit', as: :account
  get '/admin' => 'admin/categories#index'
  resources :users, except: :destroy
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users, except: [:show]
    resources :categories do
      collection { post :sort }
    end
    root to: "home#index"  
  end
  root to: "home_page#index"
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
