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

  def get_period_name(unformatted_period)
    unformatted_period += "-01"
    unformatted_period.to_datetime.strftime("%B, %Y")
  end

  def get_period_date(unformatted_period)
    unformatted_period += "-01"
    unformatted_period.to_date    
  end

  def format_shift(shift)
    return_array = shift.slice(0,11).split("-")
  end

end