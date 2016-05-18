Rails.application.routes.draw do

  devise_for :employees, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  get 'admin' => 'admin#login', as: :admin_login
  get 'admin/index'

  namespace :admin do
    get 'employees/index'
    get 'employees/show/:id' => 'employees#show', as: :employee_show
    patch 'employees/update/:id' => 'employees#update', as: :employee_update
    get 'employees/edit/:id' => 'employees#edit', as: :employee_edit
    get 'employees/remove/:id' => 'employees#remove', as: :employee_remove
    get 'employees/new'
    post 'employees/create'


    get 'visits/index'
    get 'visits/show/:id' => 'visits#show', as: :visit_show
    patch 'visits/update/:id' => 'visits#update', as: :visit_update
    get 'visits/edit/:id' => 'visits#edit', as: :visit_edit
    get 'visits/remove/:id' => 'visits#remove', as: :visit_remove
    get 'visits/new'
    post 'visits/create'
  end

  get 'homepage/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'

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
