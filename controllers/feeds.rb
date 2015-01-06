class Boudin < Sinatra::Base
  
  %w(infrastructure infbotnet inffastflux infmalware infpassive infphishing infscan infspam infspamvertising Infsuspicious infwarez infwhitelist).each do |view|
    
    get "/feeds/#{view}" , :provides => [:html, :json] do
      klass = view.camelize.constantize
      @entries = klass.all(:fields => [:id, :address])
      respond_to do |format|
        format.html { erb :'feeds/index' }
        format.json { @entries.to_json }
      end
    end

    get "/feeds/meta/#{view}" , :provides => [:html, :json] do
      klass = view.camelize.constantize
      @meta_data = klass.count
      
      respond_to do |format|
        format.html { erb :'feeds/meta' }
        format.json { @meta_data.to_json }
      end
    end      
    
  end
  
end  