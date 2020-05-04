class ManageStatisticsController < ApplicationController
  def total_stat
  	@car_models = Car.select(:id, :model).order("id ASC")
  	total_income = TotalRental.joins("join cars on total_rentals.car_id = cars.id").select("sum(DATEDIFF(rent_to_date, rent_from_date) * rent) as cost")[0].cost
    total_income == nil ? total_income = 1 : total_income
  	@num_of_rents = []
  	@num_of_rent_days = []
  	@total_car_income = []
  	@num_of_customers = []
  	@average_age = []
  	@income_share = []


  	@car_models.each do |c|
  		current_car_income = TotalRental.joins("join cars on total_rentals.car_id = cars.id").select("sum(DATEDIFF(rent_to_date, rent_from_date) * rent) as cost").where(car_id: c.id)[0].cost
  		current_car_income == nil ? current_car_income = 0 : current_car_income
  		@num_of_rents.push(TotalRental.where(car_id: c.id).order("id ASC").length)
      current_car_rent_days = TotalRental.select("SUM(DATEDIFF(rent_to_date, rent_from_date)) AS days").where(car_id: c.id)[0].days
      current_car_rent_days == nil ? current_car_rent_days = 0 : current_car_rent_days + 1
  		@num_of_rent_days.push(current_car_rent_days)
  		@total_car_income.push(current_car_income)
  		@num_of_customers.push(TotalRental.select(:user_id).distinct.where(car_id: c.id).length)
  		@average_age.push(User.joins(:total_rentals).select('AVG(DISTINCT age) as age').where("total_rentals.car_id = #{c.id}")[0].age)
  		@income_share.push((100 * current_car_income/total_income))
  	end
 
  end

  def car_stat
    id = params["id"]
    @car_model = Car.select(:model).where(id: id)[0].model
    r_users = User.joins("join total_rentals on users.id = total_rentals.user_id").select(:id, :user_name, :age).distinct.where("total_rentals.car_id = #{id}")
    f_users = User.joins("join saved_cars on users.id = saved_cars.user_id").select(:id, :user_name, :age).distinct.where("saved_cars.savedcar_id = #{id}")

    # Rentals table data
    @r_username = []
    @r_age = []
    @r_days = []
    @r_income = []

    r_users.each do |user|
      @r_username.push(user.user_name)
      @r_age.push(user.age)
      current_car_rent_days = TotalRental.select("SUM(DATEDIFF(rent_to_date, rent_from_date)) AS days").where(user_id: user.id, car_id: id)[0].days
      current_car_rent_days == nil ? current_car_rent_days = 0 : current_car_rent_days + 1
      @r_days.push(current_car_rent_days)
      @r_income.push(TotalRental.joins("join cars on total_rentals.car_id = cars.id").select("sum(DATEDIFF(rent_to_date, rent_from_date) * rent) as cost").where(user_id: user.id, car_id: id)[0].cost)
    end

    # saved_cars table
    @f_username = []
    @f_age = []
    @f_date = []

    f_users.each do |user|
      @f_username.push(user.user_name)
      @f_age.push(user.age)
      @f_date.push(SavedCar.select(:created_at).where(user_id: user.id, savedcar_id: id)[0].created_at)
    end



  end
end
