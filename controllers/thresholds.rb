# encoding: utf-8
class Boudin < Sinatra::Base
  
  get '/thresholds' do
    respond_with :index do |f|
      f.txt { grab_threshold.sort.to_s }
    end
  end

  get '/thresholds/' do

    param :gid,           Integer, required: true
    param :sid,           Integer, required: true

    tempThreshold = grab_threshold.select do |t| 
      (t.gid == params[:gid]) and (t.sid == params[:sid])
    end

    respond_with :index do |f|
      f.txt { tempThreshold.to_s }
    end
  end

  get '/thresholds/suppressions' do
    respond_with :index do |f|
      f.txt { grab_threshold.suppressions.sort.to_s }
    end
  end

  get '/thresholds/suppressions/' do

    param :gid,           Integer, required: true
    param :sid,           Integer, required: true
    param :track_by,      String, in: ["src", "dst"]
    param :ip,            String #, format: '(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\/([1-9]|[1-2][0-9]|3[0-2]))?'

    needle = Threshold::Suppression.new
    needle.gid= params[:gid]
    needle.sid= params[:sid]
    needle.track_by= params[:track_by]
    needle.ip= params[:ip]

    # we require explicit maybe we should have hay.includes?(needle)
    result = grab_threshold.suppressions do |hay| 
      hay.include?(needle)
    end

=begin
    if params[:track_by].nil? && params[:ip].nil?
       result = grab_threshold.suppressions do |t| 
          ((t.gid == params[:gid]) && (t.sid == params[:sid]))
       end
    elsif params[:ip].nil?
       result = grab_threshold.suppressions do |t| 
          ((t.gid == params[:gid]) && (t.sid == params[:sid]) && (t.track_by == params[:track_by]))
       end   
    elsif params[:track_by].nil?  
       result = grab_threshold.suppressions do |t| 
          ((t.gid == params[:gid]) && (t.sid == params[:sid]) && (t.ip == params[:ip]))
       end   
    else
        result = grab_threshold.suppressions do |t| 
          ((t.gid == params[:gid]) && (t.sid == params[:sid]) && (t.track_by == params[:track_by]) && (t.ip == params[:ip]))
        end  
    end  
=end    

    respond_with :index do |f|
      f.txt { result.to_s }
    end
  end

  get '/thresholds/eventfilters' do
    respond_with :index do |f|
      f.txt { grab_threshold.event_filters.sort.to_s }
    end
  end

  get '/thresholds/ratefilters' do
    respond_with :index do |f|
      f.txt { grab_threshold.rate_filters.sort.to_s }
    end
  end


  def grab_threshold
    threshold = Threshold::Thresholds.new
    threshold.file = '/tmp/threshold.conf'
    threshold.loadfile
    return threshold
  end

  
end