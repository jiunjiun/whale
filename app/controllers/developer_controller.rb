class DeveloperController < ApplicationController
  before_action :authenticate_user!

  layout 'developers'
end
