# encoding: utf-8
class Boudin < Sinatra::Base
  
  get '/whitelist' do
    erb :'whitelist/index'
  end
  
  #Suppress GENSID
  # suppress gen_id 129, sig_id 12
  #/opt/pulledpork_sandwich/etc/global.threshold.conf
  put '/whitelist/gensig/:gen/:sig' do |gensid|
  end
  
  #/opt/pulledpork_sandwich/etc/sensors/:sensor_id/threshold.conf
  put '/whitelist/sensor/:sensor_id/gensig/:gen/:sig' do |sensor_id, gensid|
  end
  
  ## Pulled Pork Config (sensors/dmz-alex/pulledpork.dyn.conf)
  # rule_url=http://labs.snort.org/feeds/ip-filter.blf|IPBLACKLIST|open
  # rule_url=http://malc0de.com/bl/IP_Blacklist.txt|IPBLACKLIST|open
  # ClearText Combined IP Blacklist
  # black_list=/opt/pulledpork_sandwich/export/sensors/dmz-alex/combined.blacklist
  
  ## snort.conf
  # var WHITE_LIST_PATH ../rules
  # var BLACK_LIST_PATH ../rules
  # [..]
  # Reputation preprocessor. For more information see README.reputation
  # preprocessor reputation: \
  # memcap 500, \
  # priority whitelist, \
  # nested_ip inner, \
  # whitelist $WHITE_LIST_PATH/white_list.rules, \
  # blacklist $BLACK_LIST_PATH/black_list.rules

  ## Puppet Master Manifest Extract
  ## Snort Blacklist Rules
  # file { "/usr/local/etc/snort/rules/white_list.rules":
  #   owner => 'root',
  #   group => 'wheel',
  #   mode => '0440',
  #   ensure => "present",
  #   source => [
  #       "puppet:///modules/snort/$hostname/whitelist.conf",
  #       "puppet:///modules/snort/default/whitelist.conf"
  #   ],
  #   notify => Service['snort'],
  # }

  #/opt/pulledpork_sandwich/etc/global.whitelist.conf
  get '/whitelist/ip/:ip' do |ip|
  end


  #/opt/pulledpork_sandwich/etc/global.whitelist.conf
  put '/whitelist/ip/:ip' do |ip|
  end
  
  #/opt/pulledpork_sandwich/etc/sensors/:sensor_id/whitelist.conf
  get '/whitelist/sensor/:sensor_id/ip/:ip' do |sensor_id, ip|
  end  

  #/opt/pulledpork_sandwich/etc/sensors/:sensor_id/whitelist.conf
  put '/whitelist/sensor/:sensor_id/ip/:ip' do |sensor_id, ip|
  end  
 
  
end