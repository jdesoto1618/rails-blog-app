class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # devise authenticates a user with before_action method. specify this across all controllers and their actions, except for the initial landing page
  before_action :authenticate_user!, except: :index
end
