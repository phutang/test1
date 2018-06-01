require 'net/http'
require 'json'

module AppData
  class Api

    class << self
      def get(url)
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        if response.is_a?(Net::HTTPSuccess)
          json = JSON.parse(response.body)
          json['data']
        else
          raise response.message
        end
      end
    end

  end
end