# encoding: utf-8
class Boudin < Sinatra::Base

  get '/csrf_secured' do
    erb :'csrf/secured_form'
  end

  get '/csrf_unsecured_form_failing_check' do
    erb :'csrf/unsecured_form_failing_check'
  end

  post '/csrf_response' do
    erb :'csrf/response', :locals => {:utterance => params[:utterance],
      :csrf => params[Rack::Csrf.field]}
  end

end
