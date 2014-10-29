module Totalshares
    SOCIAL_URLS = {
      "twitter" => "http://cdn.api.twitter.com/1/urls/count.json?url=",
      "facebook" => "http://graph.facebook.com/?id=",
      "linkedin" => "http://www.linkedin.com/countserv/count/share?format=json&url=",
      "reddit" => "http://www.reddit.com/api/info.json?url=",
      "stumbledupon" => "http://www.stumbleupon.com/services/1.01/badge.getinfo?url=",
      "pinterest" => "http://api.pinterest.com/v1/urls/count.json?url=",
      "gplus" => "https://clients6.google.com/rpc?key=AIzaSyCKSbrvQasunBoV16zDH9R33D88CeLr9gQ"
    }
end

require 'website'
require 'webpage'