module SchedulesHelper

  def get_days_in_month(schedule)
    splitter = schedule.period.split("-")
    year = splitter[0].to_i
    month = splitter[1].to_i
    number_of_days = Time.days_in_month(month, year)
  end

  def get_schedule_header(schedule)    
    schedule.period += "-01"
    date = schedule.period.to_date
    date_array = []
    i = 0
    get_days_in_month(schedule).times do
      date_array.push(date + i)
      i += 1
    end
    date_array
  end



end