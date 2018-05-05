class UsersController < ApplicationController
  layout :resolve_layout
  
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json

  def resolve_layout
    case action_name
    when "new", "create"
      "admin"
    else
      "application"
    end
  end

  def search
    q = params[:search]
    if q
      @users = User.search(name_or_email_cont: q).result
    else
      @users = User.all
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 5)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

        # Confirms the correct user.
        def correct_user
          @user = User.find(params[:id])
          redirect_to(root_url) unless @user == current_user
        end


        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end


        def following
          @title = "Following"
          @user  = User.find(params[:id])
          @users = @user.following.paginate(page: params[:page])
          render 'show_follow'
        end

        def followers
          @title = "Followers"
          @user  = User.find(params[:id])
          @users = @user.followers.paginate(page: params[:page])
          render 'show_follow'
        end
      end
