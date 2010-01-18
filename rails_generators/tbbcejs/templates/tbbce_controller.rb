class TbbceController < ApplicationController
	def index
		@string=params[:string].tbbc
		@tbbcef=params[:tbbcef]
	end
end
