class LinksController < ApplicationController
  attr_accessor :title, :url

  def show
    @links = Link.order(created_at: :desc).limit(25)
    render :index
  end

  def new
    @link = links_path
    @action = :post
    @button = "Submit Link"
    render :new
  end

  def create
    @link = Link.create(title: params[:title], url: params[:url])
    flash[:notice] = "Your link has been successfully submitted"
    redirect_to :root
  end

  def edit
    @link = links_update_path
    @action = :patch
    @button = "Update"
    render :edit
  end

  def update
    @link = Link.find_by(id: params[:id])
    @link.update(title: params[:title], url: params[:url])
    redirect_to :root
  end

  def destroy
    @link = Link.find_by(id: params[:id])
    @link.destroy
    redirect_to :root
  end
end