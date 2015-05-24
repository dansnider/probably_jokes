class ComediansController < ApplicationController
	
	def show
		@comedian = Comedian.find(params[:id])

		respond_to do |format|
			format.json { render json: @comedian }
		end
		
	end

end
