require 'rest-client'
require 'json'

module SchedulesService  
  
  def self.get_optimized_response(package)
    url = "https://ca-endpoints.herokuapp.com/api/optimizers"
    
    response = RestClient.post url, package, {content_type: :json, accept: :json}
    formatted_response = JSON.parse(response)    
  end
end