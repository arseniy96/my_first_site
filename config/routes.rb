Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "home#index"

  get 'about' => 'pages#about'
  get 'users/:id/articles' => 'users#articles', as: 'articles_user'
  get 'users/:id/questions' => 'users#questions', as: 'questions_user'
  get 'categories/:id/articles' => 'categories#articles', as: 'articles_category'
  get 'categories/:id/questions' => 'categories#questions', as: 'questions_category'

  resources :articles do
    resource :comments, only: [:create]
    member do
      put 'like', to: 'articles#like'
      put 'dislike', to: 'articles#dislike'
    end
  end

  resources :categories, only: [:index]

  resources :questions do
    resource :comments, only: [:create]
    member do
      put 'like', to: 'questions#like'
      put 'dislike', to: 'questions#dislike'
    end
  end

  resources :users

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
