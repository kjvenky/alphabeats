Rails.application.routes.draw do
  

  resources :song_stats
  resources :transaction_logs
  resources :orders, only: [:update, :destroy]
  resources :order_items, only: [:create, :update, :destroy]

  resources :songs, :albums

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
  resources :users, only: [:show, :update, :edit]

  get 'static_pages/home'
  get 'after_signup_home', to: "static_pages#after_signup_home"
  get 'inactive_signup_home', to: "static_pages#inactive_signup_home"
  get 'about', to: "static_pages#about"
  get 'faq', to: "static_pages#faq"
  get 'contact', to: "static_pages#contact"
  get 'updates', to: "static_pages#updates"
  get 'letter', to: "static_pages#letter"
  get 'pricing', to: "static_pages#pricing"
  get 'dashboard', to: "static_pages#dashboard"
  get 'terms', to: "static_pages#terms"
  get 'cart_page', to: "static_pages#cart_page"
  get 'payment_page', to: "static_pages#payment_page"
  get 'post_login_home', to: "static_pages#post_login_home"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'
  get 'albums/:id/album_song' => 'albums#album_song_show', as: :album_song

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
