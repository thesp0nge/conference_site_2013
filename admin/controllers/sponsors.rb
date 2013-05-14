ConferenceSite2013::Admin.controllers :sponsors do
  get :index do
    @title = "Sponsors"
    @sponsors = Sponsor.all
    render 'sponsors/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'sponsor')
    @sponsor = Sponsor.new
    render 'sponsors/new'
  end

  post :create do
    @sponsor = Sponsor.new(params[:sponsor])
    if @sponsor.save
      @title = pat(:create_title, :model => "sponsor #{@sponsor.id}")
      flash[:success] = pat(:create_success, :model => 'Sponsor')
      params[:save_and_continue] ? redirect(url(:sponsors, :index)) : redirect(url(:sponsors, :edit, :id => @sponsor.id))
    else
      @title = pat(:create_title, :model => 'sponsor')
      flash.now[:error] = pat(:create_error, :model => 'sponsor')
      render 'sponsors/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "sponsor #{params[:id]}")
    @sponsor = Sponsor.get(params[:id].to_i)
    if @sponsor
      render 'sponsors/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'sponsor', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "sponsor #{params[:id]}")
    @sponsor = Sponsor.get(params[:id].to_i)
    if @sponsor
      if @sponsor.update(params[:sponsor])
        flash[:success] = pat(:update_success, :model => 'Sponsor', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:sponsors, :index)) :
          redirect(url(:sponsors, :edit, :id => @sponsor.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'sponsor')
        render 'sponsors/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'sponsor', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Sponsors"
    sponsor = Sponsor.get(params[:id].to_i)
    if sponsor
      if sponsor.destroy
        flash[:success] = pat(:delete_success, :model => 'Sponsor', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'sponsor')
      end
      redirect url(:sponsors, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'sponsor', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Sponsors"
    unless params[:sponsor_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'sponsor')
      redirect(url(:sponsors, :index))
    end
    ids = params[:sponsor_ids].split(',').map(&:strip).map(&:to_i)
    sponsors = Sponsor.all(:id => ids)
    
    if sponsors.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Sponsors', :ids => "#{ids.to_sentence}")
    end
    redirect url(:sponsors, :index)
  end
end
