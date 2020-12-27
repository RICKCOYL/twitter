class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    
  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect_to users_path
    end
  end
  
    def show
      @user = User.find_by(params[:username])
      @users_cover = User.find_by_id!(params[:id])
      @users = User.all
    end
  
    def destroy
      session.delete(:current_user)
      flash[:notice] = 'You have successfully logged out.'
      redirect_to root_url
    end
end
