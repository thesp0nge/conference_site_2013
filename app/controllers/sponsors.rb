ConferenceSite2013::App.controllers :sponsors do
  get :index do
    @title = "Sponsors"
    @sponsors = Sponsor.all
    render 'sponsors/index'
  end
end
