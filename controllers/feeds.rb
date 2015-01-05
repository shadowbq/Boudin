class Boudin < Sinatra::Base
  
  %w(infrastructure malware).each do |view|
    get "/feed/#{view}" do
      #haml view.to_sym
      haml :"feed/#{view}"
    end
  end
  
end  