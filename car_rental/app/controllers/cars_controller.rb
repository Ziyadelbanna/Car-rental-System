class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.paginate(page: params[:page], per_page: 12)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    if params[:search].blank?
      redirect_to(cars_url, alert: "Empty field!") and return
    elsif params[:attribute] == "Name"
      @cars= Car.where("model LIKE ?", "%" + params[:search] + "%" )
    elsif params[:attribute] == "Year"
      @cars= Car.where("productionYear = ?",params[:search])
    elsif params[:attribute] == "Price"
      @cars= Car.where("rent = ?",params[:search])
    elsif params[:attribute] == "None"
      redirect_to(cars_url, alert: "Empty field!") and return
    end
  end



  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:model, :rank, :rent, :automatic, :airconditioned, :productionYear, :seats, :discription, :image)
    end

    def require_admin
      if logged_in? and !current_user.admin?
        #flash[:danger] = 'Only admin users can perform that action'
        redirect_to root_path
      end
    end

end
