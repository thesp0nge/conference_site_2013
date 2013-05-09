ConferenceSite2013::Admin.controllers :speakers do
  get :index do
    @title = "Speakers"
    @speakers = Speaker.all
    render 'speakers/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'speaker')
    @speaker = Speaker.new
    render 'speakers/new'
  end

  post :create do
    @speaker = Speaker.new(params[:speaker])
    if @speaker.save
      @title = pat(:create_title, :model => "speaker #{@speaker.id}")
      flash[:success] = pat(:create_success, :model => 'Speaker')
      params[:save_and_continue] ? redirect(url(:speakers, :index)) : redirect(url(:speakers, :edit, :id => @speaker.id))
    else
      @title = pat(:create_title, :model => 'speaker')
      flash.now[:error] = pat(:create_error, :model => 'speaker')
      render 'speakers/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "speaker #{params[:id]}")
    @speaker = Speaker.get(params[:id].to_i)
    if @speaker
      render 'speakers/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'speaker', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "speaker #{params[:id]}")
    @speaker = Speaker.get(params[:id].to_i)
    if @speaker
      if @speaker.update(params[:speaker])
        puts @speaker.github
        flash[:success] = pat(:update_success, :model => 'Speaker', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:speakers, :index)) :
          redirect(url(:speakers, :edit, :id => @speaker.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'speaker')
        render 'speakers/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'speaker', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Speakers"
    speaker = Speaker.get(params[:id].to_i)
    if speaker
      if speaker.destroy
        flash[:success] = pat(:delete_success, :model => 'Speaker', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'speaker')
      end
      redirect url(:speakers, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'speaker', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Speakers"
    unless params[:speaker_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'speaker')
      redirect(url(:speakers, :index))
    end
    ids = params[:speaker_ids].split(',').map(&:strip).map(&:to_i)
    speakers = Speaker.all(:id => ids)
    
    if speakers.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Speakers', :ids => "#{ids.to_sentence}")
    end
    redirect url(:speakers, :index)
  end
end
