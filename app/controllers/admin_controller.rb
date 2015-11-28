class AdminController < ApplicationController
	before_action :admin_check
  # GET /lessons
  # GET /lessons.json
    def admin_check

    	if current_user.admin == false

      		redirect_to main_index_path

    	end
	end
	
	def index
		@users = User.all
  		@chars = Character.all
	end

end

