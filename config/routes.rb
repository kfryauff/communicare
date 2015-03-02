Rails.application.routes.draw do
  devise_for :users
  
  resources :students, only: [:index, :new, :create, :show] do
    resources :triggers, only: [] do
      get :edit, on: :collection
    end
  end
  
  resources :interactions, only: [:index, :new]
  resources :triggers, only: :index
  resources :notes, only: :edit
  resources :comments, only: [:new, :index] do
    put :status, on: :member
  end
  
  resources :user, only: [] do
    resources :comments, only: :index
  end
  
  get 'students/p1', as: :p1_student
  get 'students/p2', as: :p2_student
  get 'students/p3', as: :p3_student
  
  get 'home/p1', as: :p1_home
  get 'home/p2', as: :p2_home
  get 'home/p3', as: :p3_home
  
  root 'home#index'

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
