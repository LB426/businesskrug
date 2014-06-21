Rails.application.routes.draw do

  resources :items
  

  get 'subsections/:id/destroy' => 'subsections#destroy', as: :subsection_destroy
  resources :subsections
  
  get 'sections/:id/destroy' => 'sections#destroy', as: :section_destroy
  resources :sections

  get 'biznesstypes/get_biznesstype'

  put 'catalogs/:id/setcoordinate' => 'catalogs#setcoordinate', as: :catalog_setcoordinate
  get 'catalogs/:id/mappopup' => 'catalogs#mappopup', as: :catalog_mappopup
  get 'catalogs/:id/destroy' => 'catalogs#destroy', as: :catalog_destroy
  resources :catalogs do
    resources :particles
  end

  get 'localities/get_locality'

  get 'home/index' => 'home#index', as: :home

  get 'admpanel/index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  get 'users/password_recovery'
  post 'users/password_send'
  get 'users/registration'
  post 'users/registration' => 'users#create', as: :user_create
  get 'users/registration_confirm'
  post 'users/registration_confirm' => 'users#regconfirm', as: :user_reg_confirm
  resources :users

  get 'welcome/index'
  root 'welcome#index'

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
