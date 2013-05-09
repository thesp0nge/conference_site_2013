ConferenceSite2013::Admin.controllers :talks do
  get :index do
    @title = "Talks"
    @talks = Talk.all
    render 'talks/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'talk')
    @talk = Talk.new
    render 'talks/new'
  end

  post :create do
    puts params[:talk]
    @talk = Talk.new(params[:talk])
    if @talk.save
      @title = pat(:create_title, :model => "talk #{@talk.id}")
      flash[:success] = pat(:create_success, :model => 'Talk')
      params[:save_and_continue] ? redirect(url(:talks, :index)) : redirect(url(:talks, :edit, :id => @talk.id))
    else
      @title = pat(:create_title, :model => 'talk')
      flash.now[:error] = pat(:create_error, :model => 'talk')
      render 'talks/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "talk #{params[:id]}")
    @talk = Talk.get(params[:id].to_i)
    if @talk
      render 'talks/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'talk', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "talk #{params[:id]}")
    @talk = Talk.get(params[:id].to_i)
    if @talk
      if @talk.update(params[:talk])
        flash[:success] = pat(:update_success, :model => 'Talk', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:talks, :index)) :
          redirect(url(:talks, :edit, :id => @talk.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'talk')
        render 'talks/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'talk', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Talks"
    talk = Talk.get(params[:id].to_i)
    if talk
      if talk.destroy
        flash[:success] = pat(:delete_success, :model => 'Talk', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'talk')
      end
      redirect url(:talks, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'talk', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Talks"
    unless params[:talk_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'talk')
      redirect(url(:talks, :index))
    end
    ids = params[:talk_ids].split(',').map(&:strip).map(&:to_i)
    talks = Talk.all(:id => ids)
    
    if talks.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Talks', :ids => "#{ids.to_sentence}")
    end
    redirect url(:talks, :index)
  end
end
