ConferenceSite2013::App.controllers :root do
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :index, :map=>'/' do
    haml :'index.html'
  end

  get :css, :map=>'/stylesheets/:name.css' do
    content_type 'text/css'
    scss :"stylesheets/#{params[:name]}.css"
  end


end
