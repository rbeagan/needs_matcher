Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "commitments#index"
  # Routes for the Tagging_join resource:
  # CREATE
  get "/tagging_joins/new", :controller => "tagging_joins", :action => "new"
  post "/create_tagging_join", :controller => "tagging_joins", :action => "create"

  # READ
  get "/tagging_joins", :controller => "tagging_joins", :action => "index"
  get "/tagging_joins/:id", :controller => "tagging_joins", :action => "show"

  # UPDATE
  get "/tagging_joins/:id/edit", :controller => "tagging_joins", :action => "edit"
  post "/update_tagging_join/:id", :controller => "tagging_joins", :action => "update"

  # DELETE
  get "/delete_tagging_join/:id", :controller => "tagging_joins", :action => "destroy"
  #------------------------------

  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

  # Routes for the Posting resource:
  # CREATE
  get "/postings/new", :controller => "postings", :action => "new"
  post "/create_posting", :controller => "postings", :action => "create"

  # READ
  get "/postings", :controller => "postings", :action => "index"
  get "/postings/:id", :controller => "postings", :action => "show"

  # UPDATE
  get "/postings/:id/edit", :controller => "postings", :action => "edit"
  post "/update_posting/:id", :controller => "postings", :action => "update"

  # DELETE
  get "/delete_posting/:id", :controller => "postings", :action => "destroy"
  #------------------------------

  # Routes for the Commitment resource:
  # CREATE
  get "/commitments/new", :controller => "commitments", :action => "new"
  post "/create_commitment", :controller => "commitments", :action => "create"

  # READ
  get "/commitments", :controller => "commitments", :action => "index"
  get "/commitments/:id", :controller => "commitments", :action => "show"

  # UPDATE
  get "/commitments/:id/edit", :controller => "commitments", :action => "edit"
  post "/update_commitment/:id", :controller => "commitments", :action => "update"

  # DELETE
  get "/delete_commitment/:id", :controller => "commitments", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
