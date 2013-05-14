ConferenceSite2013::App.controllers :venue do
  get :index do
    @title    = 'Venue'
    @sponsors = Sponsor.all
    render 'venue/index'
  end
end
