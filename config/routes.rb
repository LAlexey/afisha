AfishaSibnovostiRu::Application.routes.draw do

  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'
  mount TopList::Engine => '/', as: 'top_list'

  namespace :admin do
    root to: 'menu_items#index'

    resources :places
    resources :users
    resources :categories
    resources :events
    resources :seances
    resources :menu_items do
      collection do
        post :rebuild
      end
    end

    resources :articles
    resources :blog_posts
    resources :sections

    resource :common, only: [] do
      collection do
        get :get_city
      end
    end
  end
end