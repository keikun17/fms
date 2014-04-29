Fms::Application.routes.draw do |map|
  resources :reminders

  resources :operating_expenses

  resources :accidents 

  resources :accident_assignee_expenses

  resources :accident_vehicle_expenses

  resources :fuel_types

  resources :admins

  resources :batteries

  resources :tires

  resources :assignees

  resources :vehicle_repair_details

  resources :preventive_maintenances

  resources :vehicle_repairs

  resources :service_centers

  resources :repair_types

  resources :registration_renewals

  resources :mileages

  devise_for :company_users, :controllers => {
    :sessions => "company_users/sessions",
    :registrations => "company_users/registrations"
  }
  devise_for :administrators, :controllers => {
    :sessions => "administrators/sessions",
    :registrations => "administrator/registrations"}
  devise_for :fleet_users

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"
  root :to => "fleets#index"
  resources :users
  resources :companies do
    # resources :fleets do
    #   resources :vehicles do
    #   end
    # end
  end
  
  resources :fleets do
    resources :reminders
    resources :vehicles do 
      get :search, :on => :collection
      resources :assignees
      resources :mileages 
      resources :registration_renewals
      resources :vehicle_repairs
      resources :preventive_maintenances
      resources :tires
      resources :insurances
      resources :batteries
      resources :accidents do 
        resources :accident_assignee_expenses
        resources :accident_vehicle_expenses
      end
      resources :operating_expenses
    end
  end
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
