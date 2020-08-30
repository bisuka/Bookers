Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  root :to => 'books#top'

  # index show edit new create uppdate destry を自動設定
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
