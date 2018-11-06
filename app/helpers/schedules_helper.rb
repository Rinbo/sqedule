module SchedulesHelper

  def get_days_in_month(planning_period)
    splitter = planning_period.month.split("-")
    year = splitter[0].to_i
    month = splitter[1].to_i
    number_of_days = Time.days_in_month(month, year)
  end

  def get_schedule_header(planning_period)    
    planning_period.month += "-01"
    date = planning_period.month.to_date
    date_array = []
    i = 0
    get_days_in_month(planning_period).times do
      date_array.push(date + i)
      i += 1
    end
    date_array
  end
end