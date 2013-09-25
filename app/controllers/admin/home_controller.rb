class Admin::HomeController < Admin::AdminController
before_filter :authorize
  def index
    redirect_to reports_path 
  end
end
