require 'api_constraints'

Rails.application.routes.draw do
  # devise_for :admins
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  root to: "home#index"

  # namespace :api, defaults: {format: 'json'} do
  #   scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
  #   end
  # end

end
