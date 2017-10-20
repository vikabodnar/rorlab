class UsersController < ApplicationController
  before_action :user_session, except: [:new, :create, :login, :loginresult]


  def new
    @user=User.new
  end

  def create
    @user =User.new(user_params)
   if @user.save
    redirect_to root_path
   else
    render 'new'
   end
    end

  def login
  end

  def loginresult
      @user =User.find_by_email_and_password(params[:user][:email],params[:user][:password])
    if @user!=nil
      session[:id]=@user.id
      redirect_to user_path(@user.id)
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

private

  def user_params
    params.require(:user).permit(:firstname,:lastname,:age,:phone,:email,:password,:country,:city,:street,:apt,:link,:gender)
  end 
  
  def user_session
    @user =User.find(session[:id])
  end


end