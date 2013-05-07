ConferenceSite2013::Admin.controllers :slots do
  get :index do
    @title = "Slots"
    @slots = Slot.all
    render 'slots/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'slot')
    @slot = Slot.new
    render 'slots/new'
  end

  post :create do
    @slot = Slot.new(params[:slot])
    if @slot.save
      @title = pat(:create_title, :model => "slot #{@slot.id}")
      flash[:success] = pat(:create_success, :model => 'Slot')
      params[:save_and_continue] ? redirect(url(:slots, :index)) : redirect(url(:slots, :edit, :id => @slot.id))
    else
      @title = pat(:create_title, :model => 'slot')
      flash.now[:error] = pat(:create_error, :model => 'slot')
      render 'slots/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "slot #{params[:id]}")
    @slot = Slot.get(params[:id].to_i)
    if @slot
      render 'slots/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'slot', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "slot #{params[:id]}")
    @slot = Slot.get(params[:id].to_i)
    if @slot
      if @slot.update(params[:slot])
        flash[:success] = pat(:update_success, :model => 'Slot', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:slots, :index)) :
          redirect(url(:slots, :edit, :id => @slot.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'slot')
        render 'slots/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'slot', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Slots"
    slot = Slot.get(params[:id].to_i)
    if slot
      if slot.destroy
        flash[:success] = pat(:delete_success, :model => 'Slot', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'slot')
      end
      redirect url(:slots, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'slot', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Slots"
    unless params[:slot_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'slot')
      redirect(url(:slots, :index))
    end
    ids = params[:slot_ids].split(',').map(&:strip).map(&:to_i)
    slots = Slot.all(:id => ids)
    
    if slots.destroy
    
      flash[:success] = pat(:destroy_many_success, :model => 'Slots', :ids => "#{ids.to_sentence}")
    end
    redirect url(:slots, :index)
  end
end
