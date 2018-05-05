class WordlistsController < ApplicationController
	before_action :logged_in_user

	def show
		@user = current_user
		@wordlists = @user.wordlists.paginate(page: params[:page])
		
	end


	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end

	def wordlist_params
		params.require(:wordlist).permit(:content)
	end
end
