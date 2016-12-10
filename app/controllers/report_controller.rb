class ReportController < ApplicationController
	before_filter :verify_user

  def index
  end

  private
  	def verify_user 
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
    end
end
