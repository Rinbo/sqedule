period = Time.new
24.times do
  Schedule.create(period: period.strftime("%Y-%m"))
  period = period.next_month
end
  