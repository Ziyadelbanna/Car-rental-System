class TotalRentalsController < ApplicationController
  before_action :set_total_rental, only: [:show, :edit, :update, :destroy]

  # GET /total_rentals
  # GET /total_rentals.json
  def index
    @total_rentals = TotalRental.all
  end

  # GET /total_rentals/1
  # GET /total_rentals/1.json
  def show
  end

  # GET /total_rentals/new
  def new
    @total_rental = TotalRental.new
  end

  # GET /total_rentals/1/edit
  def edit
  end

  # POST /total_rentals
  # POST /total_rentals.json
  def create
    @total_rental = TotalRental.new(total_rental_params)

    respond_to do |format|
      if @total_rental.save
        format.html { redirect_to @total_rental, notice: 'Total rental was successfully created.' }
        format.json { render :show, status: :created, location: @total_rental }
      else
        format.html { render :new }
        format.json { render json: @total_rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /total_rentals/1
  # PATCH/PUT /total_rentals/1.json
  def update
    respond_to do |format|
      if @total_rental.update(total_rental_params)
        format.html { redirect_to @total_rental, notice: 'Total rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @total_rental }
      else
        format.html { render :edit }
        format.json { render json: @total_rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /total_rentals/1
  # DELETE /total_rentals/1.json
  def destroy
    @total_rental.destroy
    respond_to do |format|
      format.html { redirect_to total_rentals_url, notice: 'Total rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_rental
      @total_rental = TotalRental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def total_rental_params
      params.fetch(:total_rental, {})
    end
end
