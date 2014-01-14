class ReservationsController < BaseController
  
  respond_to :js
  
  def new 
    @reservation = Reservation.new()
    @reservation.set_default_values if Rails.env.development? 
  end 
  
  def create 
    begin 
      @reservation = Reservation.new(params[:reservation])
      @reservation.request = request 
      if @reservation.deliver
        flash.now[:notice] = 'Thank you for your message!' 
      else 
        render :new 
        #render :layout => false
      end 
    rescue ScriptError 
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.' 
    end 
  end
  
end