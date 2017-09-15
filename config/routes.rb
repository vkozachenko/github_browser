GithubBrowser::Application.routes.draw do

  root  'pages#home'
  get   'search' => 'pages#search'
  get   'projects/(:owner)/(:project)' => 'pages#project_info', as: :project
  get   'users/(:id)' => 'pages#user_info', as: :user

  resources :like_projects, only: [:create, :destroy]
  resources :like_users, only: [:create, :destroy]
  
end
