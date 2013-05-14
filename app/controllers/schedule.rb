ConferenceSite2013::App.controllers :schedule do
  get :index do
    @title    = 'Schedule'
    @sponsors = Sponsor.all
    render 'schedule/index'
  end
end
