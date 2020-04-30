class RentedCarsController < ApplicationController
  #before_action :set_rented_car, only: [:show, :edit, :update]
  before_action :require_admin, only: [:index]

  # GET /rented_cars
  # GET /rented_cars.json
  def index
    @rented_cars = RentedCar.paginate(page: params[:page], per_page: 12)
  end

  # GET /rented_cars/1
  # GET /rented_cars/1.json
  def show
  end

  # GET /rented_cars/new
  def new
    # means that the current user is the one who will make the rent
    @rented_car = RentedCar.new
    $car = Car.find(params[:car_id])


    # logger.info "ddd =: #{@rented_car.car_id }"
    #logger.info "mmm =: #{$car.id }"
    # logger.info "user id =: #{@rented_car.user_id}"
    #logger.info "card no =: #{@rented_car.credit_card_no}"
    # logger.info "expired date =: #{@rented_car.car_id }"
    # logger.info "rent from date =: #{@rented_car.car_id }"
    # logger.info "rent to date =: #{@rented_car.car_id }"

  end

  # GET /rented_cars/1/edit
  def edit
    #@rented_car = RentedCar.new
    @rented_car = RentedCar.find(params[:id])
    $rented_car = @rented_car
    $car = Car.find($rented_car.car_id)
    # logger.info "edit car =: #{$rented_car.id}"

  end

  # POST /rented_cars
  # POST /rented_cars.json
  def create
    @rented_car = RentedCar.new(rented_car_params)
    @rented_car.car_id = $car.id
    @rented_car.user_id = current_user.id
    @car = Car.find($car.id)

    if @rented_car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  # PATCH/PUT /rented_cars/1
  # PATCH/PUT /rented_cars/1.json
  def update
    @rented_car = $rented_car
    if @rented_car.update(rented_car_params)
      redirect_to rent_car_path
    else
      render 'edit'
    end
  end

  # DELETE /rented_cars/1
  # DELETE /rented_cars/1.json
  def destroy
    @rented_car = current_user.rented_cars.where(car_id: params[:id]).first
    @rented_car.destroy
    logger.info"here"
    # respond_to do |format|
    #   format.html { redirect_to rented_cars_url, notice: 'Rented car was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to rent_car_path
  end

  def admin_destroy
    @rented_car = RentedCar.new
    @rented_car = RentedCar.find(params[:id])
    @rented_car.destroy
    logger.info"hhiiii"
    redirect_back(fallback_location: '/')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_rented_car
    #   @rented_car = RentedCar.where("car_id = ? AND user_id = ?",params[:id] ,current_user.id)
    #   #@rented_car = current_user.rented_cars.where(car_id: params[:car_id]).first
    #   logger.info "user id =: #{@rented_car.user_id}"
    #   logger.info "car id =: #{@rented_car.car_id}"
    # end
  # this will prevent the non admin users from having access to destroy action
  def require_admin
    if logged_in? and !current_user.admin?
      #flash[:danger] = 'Only admin users can perform that action'
      redirect_to root_path
    end
  end

    # Only allow a list of trusted parameters through.
    def rented_car_params
      params.require(:rented_car).permit(:credit_card_no, :cvc, :credit_expired_date, :rent_from_date, :rent_to_date)
    end
end
