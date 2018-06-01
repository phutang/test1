class HomeController < ApplicationController
  def index
  end
  
  def report1
    @seeds = AppData::Api.get(Settings.api_url.app1)
  end

  def report2
    @seeds = AppData::Api.get(Settings.api_url.app2)
  end
end
