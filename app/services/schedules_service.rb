require 'open-uri'
require 'json'

module SchedulesService  
  
  def self.get_optimized_response(package)
    url = "https://something.com/?"\
      "q=#{package}"  
    req = open(url)
    response = JSON.parse(req.read)
    response["articles"]
  end
end