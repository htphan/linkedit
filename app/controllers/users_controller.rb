class UsersController < ApplicationController
  attr_accessor :name, :email, :password

  def new
    @user = users_path
    @action = :post
    @button = "Sign Up"
    render :new
  end

  def create
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.create(name: params[:username], 
                        email: params[:email], 
                        password: passhash)
    flash[:notice] = "Welcome to LinkedIt! Your account has been created successfully!"
    redirect_to :root
  end

  def edit
    @user = users_update_path
    @action = :patch
    @button = "Update"
    render :edit
  end

  def update
    @user = User.find_by(name: params[:name])
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user.update(name: params[:username], 
                 email: params[:email], 
                 password: passhash)

    redirect_to :root
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to :root
  end

end