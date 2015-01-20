class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]


  # GET /users/1
  # GET /users/1.json
  def show
    if @user
      redirect_to(user_path(current_user)) unless current_user?(@user)
    else
      redirect_to(user_path(current_user)) unless current_user?(@user)
    end
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
    respond_to do |format|
      if @user.save
        log_in @user
        format.html do 
          flash[:success] = "Your account has been created successfully!"
          redirect_to @user
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { flash[:success] = 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  


  private
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

    

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(edit_user_path(current_user)) unless current_user?(@user)
    end

  end
