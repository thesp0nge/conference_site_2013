ConferenceSite2013::App.controllers :venue do
  get :index do
    @title = 'Venue'
    render 'venue/index'
  end
end
