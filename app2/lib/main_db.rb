class MainDb < ActiveRecord::Base
  self.establish_connection(Settings.main_database.url)
end
