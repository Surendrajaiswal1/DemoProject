class UsersController < ApplicationController
    def index
      unless session[:name].nil?
      # @user=params[:username]
      @user = session[:name]
      session.delete(:name)
      else
      redirect_to login_path
      #cookies.delete(:name)
  end
  end
   def login
    session.delete(:name)
   end
  def show
    @user=User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render new
    end
  end

  def login1
    name=params[:name]
    password=params[:password]
    user=User.find_by(name: name) && User.find_by(password: password) 
    if user
      username=user.name
      #cookies[:name]=username
      session[:name]=username
      # username = 
      redirect_to index_path
    else
      puts "Wrong"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:password)
    end
end
