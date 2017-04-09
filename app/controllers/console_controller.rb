class ConsoleController < ApplicationController
  before_action :authenticate_user!

  layout 'console'
end
