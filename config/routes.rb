Rails.application.routes.draw do

  root to: 'links#index'
  
  # User
  get 'users/new', to: 'users#new'            # Signup form
  post 'users', to: 'users#create'            # Create method linked from signup form
  get 'user/:name', to: 'users#show'          # Shows user profile
  get 'user/:name/edit', to: 'users#edit'     # User edit form
  patch 'user/:name', to: 'users#update'      # Update user form action

  # Link
  get 'links', to: 'links#index'                                     # Links index/homepage
  get 'links/new', to: 'links#new'                                   # New link form
  post 'links', to: 'links#create'                                   # Create link form action
  get 'link/:id', to: 'links#redirect', as: 'links_redirect'         # Redirect link to supplied url
  delete 'link/:id', to: 'links#destory', as: 'links_detroy'         # Destroys link and its comments
  get 'link/:id/edit', to: 'links#edit', as: 'links_edit'            # Link edit form
  patch 'link/:id', to: 'links#update', as: 'links_update'           # Update link form action

  # Comments
  get 'link/:id/comments', to: 'comments#show'                       # Link, comments, comment form
  post 'link/:id/comments', to: 'comments#create'                    # Create comment form action
  delete 'link/:link_id/comment/:comment_id', to: 'comments#destroy' # Destroys comment
  get 'link/:link_id/comment/:comment_id/edit', to: 'comments#edit'	 # Comment edit form	
  patch 'link/:link_id/comment/:comment_id', to: 'comments#update'   # Update comment form action

  # Sublinkedit  
  get 'l/new', to: 'sublinkedit#new'      # New sublinkedit form
  get 'l', to: 'sublinkedit#index'  			# Index of all sublinkedits
  post 'l', to: 'sublinkedit#create'      # Creates a new sublinkedit
  get 'l/:name', to: 'sublinkedit#show'		# Specific sublinkedit links index										

  # Sessions
  get 'users/login', to: 'sessions#login'       # Login page
  post 'users/session', to: 'sessions#create'   # Sets session ID
  delete 'users/session', to: 'session#destory' # Destroys session ID

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
