class CommentsController < ApplicationController

	def show
		# Will change according to voting score 
		@links = Link.order(created_at: :desc).limit(25)
		render :show
	end

	def create
		@link = Link.find(params[:link_id])
		@comment = Comment.create(content: params[:content], 
			 												user_id: params[:user_id], 
			 												link_id: params[:link_id])
		redirect_to comment_show_path(@link) 
	end

	def destroy
		@link = Link.find(params[:link_id])
		@comment = Comment.find(params[:comment_id])
		@comment.destroy
		redirect_to comment_show_path(@link) 
	end

	def edit
		@link = params[:link_id]
		@comment = Comment.find(params[:comment_id])
		@path = comment_update_path(@link, @comment.id) 
		@verb = :patch
		render :edit
	end

	def update
		@link = Link.find(params[:link_id])
		@comment = Comment.find(params[:comment_id])
		@comment.update_attributes(content: params[:content])
		redirect_to comment_show_path(@link) 
	end

end