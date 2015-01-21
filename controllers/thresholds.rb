# encoding: utf-8
class Boudin < Sinatra::Base
  
  get '/thresholds' do
    respond_with :index do |f|
      f.txt { t_index.sort.to_s }
    end
  end

  get '/thresholds/' do

    param :gid,           Integer, required: true
    param :sid,           Integer, required: true

    tempThreshold = Threshold::Thresholds.new
    t_index.each do |t| 
      if ((t.gid == params[:gid]) and (t.sid == params[:sid]))
        tempThreshold << t
      end  
    end

    respond_with :index do |f|
      f.txt { tempThreshold.to_s }
    end
  end

  get '/thresholds/suppressions' do
    respond_with :index do |f|
      f.txt { t_index("suppressions").sort.to_s }
    end
  end

  get '/thresholds/suppressions/' do

    param :gid,           Integer, required: true
    param :sid,           Integer, required: true
    param :track_by,      String, in: ["src", "dst"]
    param :ip,            String #, format: '(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([1-9]|[1-2][0-9]|3[0-2]))?'

    tempThreshold = Threshold::Thresholds.new
    t_index("suppressions").each do |t| 
      if ((t.gid == params[:gid]) and (t.sid == params[:sid]))
          if params[:track_by] == t.track_by || params[:track_by].nil?
            if params[:ip] == t.ip || params[:ip].nil?
              tempThreshold << t
            end  
          end  
      end  
    end

    respond_with :index do |f|
      f.txt { tempThreshold.to_s }
    end
  end

  get '/thresholds/eventfilters' do
    respond_with :index do |f|
      f.txt { t_index("eventfilters").sort.to_s }
    end
  end

  get '/thresholds/ratefilters' do
    respond_with :index do |f|
      f.txt { t_index("ratefilters").sort.to_s }
    end
  end

  
  #get '/thresholds/suppressions' do
  #  erb :'thresholds/suppressions/index'
  #end

  def t_index(filter="")
    tempThreshold = Threshold::Thresholds.new
    a = Threshold::Thresholds.new
    a.file = '/tmp/threshold.conf'
    a.loadfile
    if filter == ""
      return a
    elsif filter == "suppressions"
      a.each{|t| tempThreshold << t if t.class.to_s == "Threshold::Suppression" }
      return tempThreshold
    elsif filter == "eventfilters"
      a.each{|t| tempThreshold << t if t.class.to_s == "Threshold::EventFilter" }
      return tempThreshold
    elsif filter == "ratefilters"
      a.each{|t| tempThreshold << t if t.class.to_s == "Threshold::RateFilter" }
      return tempThreshold
    end

  end

  
end