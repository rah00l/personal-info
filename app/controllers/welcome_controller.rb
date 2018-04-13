class WelcomeController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'geocoder'

  def index
    uri = URI.parse("http://ifconfig.co")
    # @response = Net::HTTP.get_response(uri)
    
    # TODO 
    # Need to extract @ip_address from above generated response body  @response.body

    @ip_address = '203.90.98.182'
    info = Geocoder.address(@ip_address).split(", ")
    # info = ["Pune", "MH 411001", "India"]
    @city = info[0]
    state = info[1].split(' ')
    @state = state[0]
    @country = info[2]

    cookies[:city] = @city
    cookies[:state] = @state
    cookies[:country] = @country
  end
end
