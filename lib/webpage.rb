require 'typhoeus'
require 'json'
require 'yaml'
require_relative 'totalshares'
class Webpage
  include Totalshares
  def initialize(url)
    @url = url
    @url ="http://#{url}" unless url.start_with? "https://" or url.start_with? "http://"
  end

  def twitter(opts = {})
    output = Typhoeus.get(SOCIAL_URLS["twitter"] + @url)
    count = JSON.parse(output.response_body)["count"].to_i || 0
    puts "#{@url}\n#{count}" if opts[:v]
    count
  end

  def facebook(opts = {})
    output = Typhoeus.get(SOCIAL_URLS["facebook"] + @url)
    count = JSON.parse(output.response_body)["shares"].to_i || 0
    puts "#{@url}\n#{count}" if opts[:v]
    count
  end

  def linkedin(opts = {})
    output = Typhoeus.get(SOCIAL_URLS["linkedin"] + @url)
    count = JSON.parse(output.response_body)["count"].to_i || 0
    puts "#{@url}\n#{count}" if opts[:v]
    count
  end

  def reddit(opts = {})
    output = Typhoeus.get(SOCIAL_URLS["reddit"] + @url)
    count = JSON.parse(output.response_body)["data"]["children"].size.to_i || 0
    puts "#{@url}\n#{count}" if opts[:v]
    count
  end

  def stumbledupon(opts = {})
    output = Typhoeus.get(SOCIAL_URLS["stumbledupon"] + @url)
    count = JSON.parse(output.response_body)["result"]["views"].to_i || 0
    puts "#{@url}\n#{count}" if opts[:v]
    count
  end

  def pinterest(opts = {})
    output = Typhoeus.get(SOCIAL_URLS["pinterest"] + @url)
    if output.response_code.eql? 200
      output = output.response_body
      json_output = output[output.index("{"), output.rindex("}")- (output.index("{")-1)]
      count = JSON.parse(json_output)["count"].to_i || 0
      puts "#{@url}\n#{count}" if opts[:v]
      count
    else
      nil
    end
  end

  def gplus(opts = {})
    body = [
        {
          method: "pos.plusones.get",
          id: "p",
          params: {
          nolog: true,
          id: @url,
          source: "widget",
          userId: "@viewer",
          groupId: "@self"
        },
        jsonrpc: "2.0",
        key: "p",
        apiVersion: "v1"
        }
      ]
    output = Typhoeus.post(SOCIAL_URLS["gplus"], body: JSON.dump(body), headers: { "content-type" => "application/json", "accept" => "application/json"})
    count = JSON.parse(output.response_body)[0]["result"]["metadata"]["globalCounts"]["count"].to_i || 0
    puts "#{@url}\n#{count}" if opts[:v]
    count
  end

  def all(opts = {})
    response =  {}
    SOCIAL_URLS.each do |key, value|
      response[key] = self.send "#{key}"
    end
    puts "#{@url}\n#{response}" if opts[:v]
    response
  end

  def shares_selected(social_networks,opts = {})
    response =  {}
    social_networks.each do |sn|
      response[sn] = self.send "#{sn}" unless SOCIAL_URLS[sn].nil? or SOCIAL_URLS[sn] == ""
    end
    puts "#{@url}\n#{response}" if opts[:v]
    response
  end
end