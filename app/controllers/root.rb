ConferenceSite2013::App.controllers :root do
  get :index, map: '/' do
    @sponsors = Sponsor.all
    render 'root/index'
  end

  get :css, map: '/stylesheets/style.css' do
    content_type 'text/css'
    scss :'stylesheets/style.css'
  end
end
