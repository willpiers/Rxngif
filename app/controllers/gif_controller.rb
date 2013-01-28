class GifController < ApplicationController

	def index
		@pics = Picture.all
	end

	def new
	end

	def create
		if params[:new_url].present?
			p = Picture.new
			p.url = params[:new_url]
			p.save
		end

		redirect_to "http://localhost:3000/pictures"
	end

	def edit
		@pic_id = params[:pic_id]
		@pic = Picture.find_by_id @pic_id
	end

	def update
		if params[:url].present? || params[:caption].present?
			p = Picture.find_by_id params[:pic_id]
			p.url = params[:url]
			p.caption = params[:caption]
			p.save
		end
		redirect_to "http://localhost:3000/pictures/#{params[:pic_id]}"
	end

	def show
		@pic_id = params[:pic_id].to_i
		@pic = Picture.find_by_id(@pic_id)
	end

	def destroy
	end



end