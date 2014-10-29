Totalshares
===========

Totalshares is a ruby gem that provides classes(Website and Webpage) to get the number of shares of a specific webpage or an entire website on various social networks. 

Webpage
---
```ruby
2.1.0 :001 > require 'totalshares'
 => true 
2.1.0 :002 > webpage = Totalshares::Webpage.new "http://www.thegeekstuff.com/2014/10/linux-kvm-create-guest-vm/"
 => #<Webpage:0x00000101729578 @url="http://www.thegeekstuff.com/2014/10/linux-kvm-create-guest-vm/"> 
2.1.0 :003 > webpage.gplus :v => true
http://www.thegeekstuff.com/2014/10/linux-kvm-create-guest-vm/
26
 => 26 
2.1.0 :004 > webpage.gplus
 => 26 
2.1.0 :005 > webpage.twitter
 => 23 
2.1.0 :006 > webpage.facebook
 => 55 
2.1.0 :007 > webpage.pinterest
 => 0 
2.1.0 :008 > webpage.stumbledupon
 => 0 
2.1.0 :009 > webpage.linkedin
 => 1 
2.1.0 :010 > webpage.reddit
 => 0 
2.1.0 :012 > webpage.shares_selected(["facebook", "linkedin", "twitter", "gplus"])
 => {"facebook"=>55, "linkedin"=>1, "twitter"=>23, "gplus"=>26} 
2.1.0 :011 > webpage.shares_selected(["facebook", "linkedin", "twitter", "gplus"], :v => true)
http://www.thegeekstuff.com/2014/10/linux-kvm-create-guest-vm/
{"facebook"=>55, "linkedin"=>1, "twitter"=>23, "gplus"=>26}
 => {"facebook"=>55, "linkedin"=>1, "twitter"=>23, "gplus"=>26}
2.1.0 :013 > webpage.all
 => {"twitter"=>23, "facebook"=>55, "linkedin"=>1, "reddit"=>0, "stumbledupon"=>0, "pinterest"=>0, "gplus"=>26} 
```
Website
---
Website class crawls the given URL and perform the given webpage method on every crawled webpage. We provide a number of settings to control the behaviour of crawler.
```ruby
2.1.0 :014 > website = Totalshares::Website.new("www.thegeekstuff.com")
 => #<Website:0x00000101406170 @url="http://www.thegeekstuff.com", @twitter_count=0, @facebook_count=0, @linkedin_count=0, @reddit_count=0, @stumbledupon_count=0, @pinterest_count=0, @gplus_count=0> 
2.1.0 :015 > puts website.facebook :depth_limit => 1, :obey_robots_txt => true
{"http://www.thegeekstuff.com/"=>285, "http://www.thegeekstuff.com/best-of-the-blog"=>9, "http://www.thegeekstuff.com/about/"=>4, "http://www.thegeekstuff.com/linux-101-hacks-ebook/"=>181, "http://www.thegeekstuff.com/2014/10/linux-kvm-create-guest-vm/"=>55, "http://www.thegeekstuff.com/2014/10/grunt-contrib-watch-automate/"=>5, "http://www.thegeekstuff.com/2014/09/startpar-command/"=>11, "http://www.thegeekstuff.com/2014/09/bash-shellshock-fix-cve-2014-7169/"=>99, "http://www.thegeekstuff.com/2014/10/install-ssl-cert-esxi-vcenter/"=>2, "http://www.thegeekstuff.com/2014/08/parse-text-file-using-python/"=>11, "http://www.thegeekstuff.com/2014/09/fuzzy-logic-cpp/"=>11, "http://www.thegeekstuff.com/2014/08/add-route-ip-command/"=>14, "http://www.thegeekstuff.com/linux-sysadmin/"=>24, "http://www.thegeekstuff.com/bash-101-hacks-ebook/"=>4, "http://www.thegeekstuff.com/sed-awk-101-hacks-ebook/"=>8, "http://www.thegeekstuff.com/vim-101-hacks-ebook/"=>9, "http://www.thegeekstuff.com/nagios-core-ebook/"=>9, "http://www.thegeekstuff.com/2010/12/50-unix-linux-sysadmin-tutorials/"=>480, "http://www.thegeekstuff.com/2009/01/12-amazing-and-essential-linux-books-to-enrich-your-brain-and-library/"=>62, "http://www.thegeekstuff.com/2010/11/50-linux-commands/"=>513, "http://www.thegeekstuff.com/2010/03/30-things-to-do-when-you-are-bored-and-have-a-computer/"=>831, "http://www.thegeekstuff.com/2010/08/gtd-getting-things-done/"=>38, "http://www.thegeekstuff.com/2010/09/linux-file-system-structure/"=>891, "http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples/"=>153, "http://www.thegeekstuff.com/2009/07/linux-ls-command-examples/"=>74, "http://www.thegeekstuff.com/2010/08/bug-tracking-system/"=>106, "http://www.thegeekstuff.com/2009/06/15-practical-crontab-examples/"=>223, "http://www.thegeekstuff.com/2009/03/15-practical-linux-find-command-examples/"=>81, "http://www.thegeekstuff.com/2008/08/15-examples-to-master-linux-command-line-history/"=>53, "http://www.thegeekstuff.com/2009/06/expertise-in-google-search/"=>214, "http://www.thegeekstuff.com/2010/08/raid-levels-tutorial/"=>722, "http://www.thegeekstuff.com/2009/01/vi-and-vim-macro-tutorial-how-to-record-and-play/"=>64, "http://www.thegeekstuff.com/2010/01/15-practical-unix-linux-top-command-examples/"=>61, "http://www.thegeekstuff.com/2009/09/top-5-best-network-monitoring-tools/"=>57, "http://www.thegeekstuff.com/2008/06/how-to-monitor-remote-linux-host-using-nagios-30/"=>21, "http://www.thegeekstuff.com/2009/07/best-gmail-tips-and-tricks/"=>73, "http://www.thegeekstuff.com/2009/06/top-5-best-linux-os-distributions/"=>155, "http://www.thegeekstuff.com/2010/09/rsync-command-examples/"=>124, "http://www.thegeekstuff.com/2009/09/the-ultimate-wget-download-guide-with-15-awesome-examples/"=>166, "http://www.thegeekstuff.com/2009/07/top-5-best-linux-text-editors/"=>76, "http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/"=>80, "http://www.thegeekstuff.com/2010/06/bash-array-tutorial/"=>89, "http://www.thegeekstuff.com/2008/11/3-steps-to-perform-ssh-login-without-password-using-ssh-keygen-ssh-copy-id/"=>100, "http://www.thegeekstuff.com/2009/10/unix-sed-tutorial-advanced-sed-substitution-examples/"=>41, "http://www.thegeekstuff.com/2010/08/tcpdump-command-examples/"=>98, "http://www.thegeekstuff.com/2010/03/netstat-command-examples/"=>73, "http://www.thegeekstuff.com/2008/06/the-ultimate-guide-for-creating-strong-passwords/"=>356, "http://www.thegeekstuff.com/category/linux/"=>1, "http://www.thegeekstuff.com/2008/08/turbocharge-putty-with-12-powerful-add-ons-software-for-geeks-3/"=>169, "http://www.thegeekstuff.com/2008/08/6-steps-to-secure-your-home-wireless-network/"=>136, "http://www.thegeekstuff.com/category/bash-2/"=>1, "http://www.thegeekstuff.com/category/iptables/"=>2, "http://www.thegeekstuff.com/category/ubuntu/"=>1, "http://www.thegeekstuff.com/category/c-plus-plus/"=>1}
7127
```
website.facebook gives a hash(all the urls and facebook shares) and the sum of all shares of these URLs. 

All the methods that  webpage provides are also provided by website class.
```ruby
website.facebook :depth_limit => 1, :v => true
website.twitter :depth_limit => 2, :obey_robots_txt => true
website.gplus, :obey_robots_txt => true
website.pinterest
website.stumbledupon
website.reddit
website.shares_selected(["facebook", "linkedin", "twitter", "gplus"], :depth_limit => 1, :v => true)
website.all :depth_limit => 1, :v => true
```

Following are the properties of crwaler, you can provide just like :depth_limit.
* :threads
* :user_agent
* :delay
* :obey_robots_txt
* :depth_limit
* :redirect_limit
* :cookies
* :accept_cookies
* :proxy_host
* :proxy_port
* :read_timeout
