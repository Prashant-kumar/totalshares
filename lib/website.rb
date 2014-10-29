require 'webpage'
require 'anemone'
module Totalshares
  class Website
    def initialize(url)
      @url = url
      @url ="http://#{url}" unless url.start_with? "https://" or url.start_with? "http://"
      SOCIAL_URLS.each do |key, value|
        instance_variable_set("@#{key}_count", 0)
        self.class.send(:define_method, "#{key}") {|opts={}| self.shares(key, opts)}
        self.class.send(:define_method, "all") {|opts={}| self.shares("all", opts)}
      end
    end

    def shares_selected(social_networks, opts = {})
      social_networks.each do |sn|
        instance_variable_set("@#{sn}_count", 0)
      end
      output = {}
      opts[:skip_query_strings] = true
      Anemone.crawl(@url, opts) do | anemone |
        anemone.on_every_page do |page|
          webpage = Webpage.new(page.url.to_s)
          count = webpage.send("shares_selected",social_networks)
          print_flag=false
          count.each do |key,value|
            print_flag=true if value > 0
            sum_of_count = instance_variable_get("@#{key}_count") + value
            instance_variable_set("@#{key}_count", sum_of_count)
          end
          puts "#{page.url.to_s}\n#{count}" if print_flag and opts[:v]
          output[page.url.to_s]=count if print_flag
        end
      end
      total=0
      social_networks.each do |sn|
        variable_name = "@#{sn}_count"
        puts "#{sn}: #{instance_variable_get(variable_name)}"
        total += instance_variable_get(variable_name)
      end
      puts "Total Shares: #{total}" if opts[:v]
      return output, total
    end

    protected
    def shares(method_name, opts = {})
      SOCIAL_URLS.each do |key, value|
        instance_variable_set("@#{key}_count", 0)
      end
      output = {}
      opts[:skip_query_strings] = true
      Anemone.crawl(@url, opts) do | anemone |
        anemone.on_every_page do |page|
          webpage = Webpage.new(page.url.to_s)
          count = webpage.send("#{method_name}")

          if method_name.eql?("all")
            print_flag=false
            count.each do |key,value|
              print_flag=true if value > 0
              sum_of_count = instance_variable_get("@#{key}_count") + value
              instance_variable_set("@#{key}_count", sum_of_count)
            end
            puts "#{page.url.to_s}\n#{count}" if print_flag and opts[:v]
            output[page.url.to_s] = count if print_flag
          else
            puts "#{page.url.to_s}\n#{count}" if !(count.eql? 0) and opts[:v]
            output[page.url.to_s] = count if !(count.eql? 0)

            sum_of_count = instance_variable_get("@#{method_name}_count") + count
            instance_variable_set("@#{method_name}_count", sum_of_count)
          end

        end
      end

      if method_name.eql?("all")
        total=0
        SOCIAL_URLS.each do |key, value|
          variable_name = "@#{key}_count"
          puts "#{key}: #{instance_variable_get(variable_name)}" if opts[:v]
          total += instance_variable_get(variable_name)
        end
        puts "Total Shares: #{total}" if opts[:v]
        return output, total
      else
        puts "#{method_name}: #{instance_variable_get("@#{method_name}_count")}" if opts[:v]
        return output, instance_variable_get("@#{method_name}_count")
      end
    end
  end
end