class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy, :show]
  before_action :require_admin, only: [:destroy, :index]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id

        format.html { redirect_to cars_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def my_saved
    @saved_cars = current_user.savedcars
  end


  # this method handles the user favourite
  def add_cars_to_favourite

    @car = User.find(params[:savedcar])
    current_user.saved_cars.build(savedcar_id: @car.id)

    if current_user.save
      flash[:notice] = 'car was successfully added'
    else
      flash[:danger] = 'There was something wrong with the car saving'
    end
    # redirect to the same page
    redirect_back(fallback_location:"/")
  end

  def my_rented
    @rented_cars = current_user.rented_cars
  end

  def add_cars_to_rent
    #@rented_cars = RentedCar.where(user_id: current_user.id).first
    @rented_cars = current_user.rented_cars
      #logger.info "size: #{@rented_cars.length}"

  end


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to cars_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_name, :password, :email, :name, :address, :dob, :age, :points, :admin)
    end

  def require_same_user
    if current_user != @user and !current_user.admin?
      #flash[:danger] = 'You can only edit your own account'
      redirect_to root_path
    end
  end

  # this will prevent the non admin users from having access to destroy action
  def require_admin
    if logged_in? and !current_user.admin?
      #flash[:danger] = 'Only admin users can perform that action'
      redirect_to root_path
    end
  end
end
