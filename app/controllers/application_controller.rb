class ApplicationController < ActionController::Base
  include CurrentOrder
  before_action :set_order
end
