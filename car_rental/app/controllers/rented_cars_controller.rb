class RentedCarsController < ApplicationController
  before_action :set_rented_car, only: [:show, :edit, :update, :destroy]

  # GET /rented_cars
  # GET /rented_cars.json
  def index
    @rented_cars = RentedCar.all
  end

  # GET /rented_cars/1
  # GET /rented_cars/1.json
  def show
  end

  # GET /rented_cars/new
  def new
    @rented_car = RentedCar.new
  end

  # GET /rented_cars/1/edit
  def edit
  end

  # POST /rented_cars
  # POST /rented_cars.json
  def create
    # @car = Car.new
    # @car =current_user.rentedcars
    # @RentedCar.rentedcar_id = RentedCar.find(params[:rentedcar_id]).id

    @rented_car = RentedCar.new(rented_car_params)
    @rented_car.user_id = current_user.id
    @rented_car.rentedcar_id = @car.id


    respond_to do |format|
      if @rented_car.save
        format.html { redirect_to @rented_car, notice: 'Rented car was successfully created.' }
        format.json { render :show, status: :created, location: @rented_car }
      else
        format.html { render :new }
        format.json { render json: @rented_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rented_cars/1
  # PATCH/PUT /rented_cars/1.json
  def update
    respond_to do |format|
      if @rented_car.update(rented_car_params)
        format.html { redirect_to @rented_car, notice: 'Rented car was successfully updated.' }
        format.json { render :show, status: :ok, location: @rented_car }
      else
        format.html { render :edit }
        format.json { render json: @rented_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rented_cars/1
  # DELETE /rented_cars/1.json
  def destroy
    @rented_car.destroy
    respond_to do |format|
      format.html { redirect_to rented_cars_url, notice: 'Rented car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rented_car
      @rented_car = RentedCar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rented_car_params
      #params.fetch(:rented_car, {})
      params.require(:rented_car).permit(:credit_card_no, :cvc, :credit_expired_date, :rent_from_date, :rent_to_date)
    end
end
