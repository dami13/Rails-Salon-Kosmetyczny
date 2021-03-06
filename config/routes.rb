Rails.application.routes.draw do

  devise_for :clients
  devise_for :employees, path: 'admin', path_names: {sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', skip: [:registrations]}

  get 'admin' => 'admin#login', as: :admin_login
  get 'clients' => 'clients#login', as: :clients_login
  get 'clients/my_account' => 'clients#my_account', as: :my_account
  get 'admin/index'
  get 'admin/cron'
  get 'clients/edit' => 'clients#edit', as: :clients_edit
  get 'about' => 'about#index', as: :about_site

  namespace :admin do
    get 'employees/index'
    get 'employees/show/:id' => 'employees#show', as: :employee_show
    patch 'employees/update/:id' => 'employees#update', as: :employee_update
    get 'employees/edit/:id' => 'employees#edit', as: :employee_edit
    get 'employees/remove/:id' => 'employees#remove', as: :employee_remove
    get 'employees/new'
    post 'employees/create'

    get 'clients/index'
    get 'clients/show/:id' => 'clients#show', as: :client_show
    patch 'clients/update/:id' => 'clients#update', as: :client_update
    get 'clients/edit/:id' => 'clients#edit', as: :client_edit
    get 'clients/remove/:id' => 'clients#remove', as: :client_remove
    get 'clients/new'
    post 'clients/create'

    get 'visits/index'
    post 'visits/index'
    get 'visits/show/:id' => 'visits#show', as: :visit_show
    patch 'visits/update/:id' => 'visits#update', as: :visit_update
    get 'visits/edit/:id' => 'visits#edit', as: :visit_edit
    get 'visits/remove/:id' => 'visits#remove', as: :visit_remove
    get 'visits/scheduler/:id' => 'visits#scheduler', as: :visit_scheduler
    get 'visits/new'
    post 'visits/create'

    get 'service/index'
    get 'service/show/:id' => 'service#show', as: :service_show
    patch 'service/update/:id' => 'service#update', as: :service_update
    get 'service/edit/:id' => 'service#edit', as: :service_edit
    get 'service/remove/:id' => 'service#remove', as: :service_remove
    get 'service/new'
    post 'service/create'

    get 'comments/index'
    post 'comments/index'
    get 'comments/show/:id' => 'comments#show', as: :comments_show
    patch 'comments/update/:id' => 'comments#update', as: :comments_update
    get 'comments/edit/:id' => 'comments#edit', as: :comments_edit
    get 'comments/remove/:id' => 'comments#remove', as: :comments_remove
    get 'comments/new'
    post 'comments/create'

    get 'employees_services/index'
    get 'employees_services/show_new/:id' => 'employees_services#show_new', as: :employees_services_show_new
    get 'employees_services/show_remove/:id' => 'employees_services#show_remove', as: :employees_services_show_remove
    get 'employees_services/remove/:employee_id&:service_id' => 'employees_services#remove', as: :employees_services_remove
    get 'employees_services/create:employee_id&:service_id' => 'employees_services#create', as: :employees_services_create

    get 'options/index'
  end

  get 'homepage/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'
  get 'visits' => 'visits#index'
  post 'visits' => 'visits#create'
  get 'reservation' => 'reservation#index'
  post 'reservation' => 'reservation#create'
  get 'services' => 'services#index'
  get 'visits/new'
  post 'visits/create'
  get 'visits/index'
  post 'visits/index'
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
