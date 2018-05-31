require 'net/http'
require 'json'

class HomeController < ApplicationController
  def index
  end
  
  def report1
    @seeds = get_data(Settings.api_url.app1)['data']
  end

  def report2
    @seeds = get_data(Settings.api_url.app2)['data']
  end

  private
  def get_data(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
