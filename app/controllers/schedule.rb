ConferenceSite2013::App.controllers :schedule do
  get :index do
    @title = 'Schedule'
    render 'schedule/index'
  end
end
