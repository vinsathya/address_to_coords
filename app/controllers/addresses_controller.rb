require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    @address = "the corner of Foster and Sheridan"
    @url_safe_address = URI.encode(@address)

    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"

    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
  end

  def address_form
 
  end

  def convert_complete
    @address = params[:address]
    @url_safe_address = URI.encode(@address)

    @url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=true"
    raw_data = open(@url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]  
  end
end
