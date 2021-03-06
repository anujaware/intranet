require 'net/http'
module Api
  class Bonusly

    def initialize(options = {})
      options = {
        size: 100
      }.merge(options)
      @uri = URI.parse('https://bonus.ly/api/v1/bonuses')
      @token = BONUSLY_TOKEN
      get_request
    end

    def get_request
      http = Net::HTTP.new(@uri.host, @uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      response = http.get(@uri.path+"?access_token=#{@token}")
      begin 
        @data = JSON.parse(JSON.parse(response.body)['result'])
      rescue
        @data = []
      end
    end

    def all_bonusly_messages
      messages = []
      @data.each { |d| messages << self.bonusly_message_for(d) }
      messages
    end

    def bonusly_message_for(m, options = {})
      "<li class='media'>
        <a class='pull-left' href='#'>
          <img class='media-object' src='#{m["receiver"]["profile_pic_url"]}' alt='#{m["receiver"]["short_name"]}' /> 
        </a>
        <a class='pull-right' href='#'>
          <img class='media-object' src='#{m["giver"]["profile_pic_url"]}' alt='#{m["giver"]["short_name"]}' /> 
        </a>
        <div class='media-body'>
          <h5 class='media-heading'>#{m["receiver"]["short_name"]} received <span class='label label-info'>₹#{m["amount"]}</span> from #{m["giver"]["short_name"]} <span class='label label-warning'> #{m["value"]} </span></h5>
          <p>
            #{m["reason"]} 
          </p>
        </div>
      </li>"
    end
  end
end
