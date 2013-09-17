TopList::Engine.routes.draw do
  namespace :admin do
    get '/top_lists/:model(/:top_list_name)', to: 'top_list_items#show'
    resources :top_lists, controller: :top_list_items, only: [] do
      collection do
        post :update
        post :toggle_position
      end
    end
  end
end
