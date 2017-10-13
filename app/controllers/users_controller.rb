class UsersController < ApplicationController
	before_action :user_session, exept: [:new, :create, :login, :loginresult]

def new
end

def create
	@user = User.new(user_params)
	@user.save
	redirect_to root_path
end

def login
end

def loginresult
    pp params[:users][:email]
    pp params[:users][:password]
    pp @user = User.find_by_email_and_password(params[:users][:email], params[:users][:password])
    if @user!= nil
    session[:id] = @user.id
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
	params.require(:user).permit(:lastname, :firstname, :password, :email)
end

def user_session
	@user = User.find(session[:id])
	end


end
