class SublinkeditsController < ApplicationController

	def new
		render :new
	end

	def index
		@sublinkedits = Sublinkedit.order(title: :asc)
		render :index
	end

	def create
		@sublinkedit = Sublinkedit.find_or_create_by(title: params[:title])
		redirect_to l_show_path(@sublinkedit.title)
	end

	def show
		@sublinkedit = Sublinkedit.find_by(title: params[:title])
		@links = Link.where(sub_id: @sublinkedit.id)
		render :show		
	end

end