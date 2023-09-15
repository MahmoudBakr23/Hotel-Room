class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @start_date = Date.parse(params[:reservation][:start_date])
    @end_date = Date.parse(params[:reservation][:end_date])

    if can_reserve_room?(@room, @start_date, @end_date)
      @reservation = current_user.reservations.build(room: @room, start_date: @start_date, end_date: @end_date)

      if @reservation.save
        redirect_to current_user, notice: 'Reservation successful!'
      else
        render 'new'
      end
    else
      redirect_to room_path(@room), alert: 'Room is not available for the selected date range.'
    end

  end

  def destroy
    @reservation = Reservation.find(params[:id])

    if @reservation.user == current_user
      @reservation.destroy
      redirect_to current_user, notice: 'Reservation canceled successfully.'
    else
      redirect_to current_user, alert: 'You are not authorized to cancel this reservation.'
    end
  end

  private

  def can_reserve_room?(room, start_date, end_date)
    !Reservation.exists?(room: room, start_date: start_date..end_date)
  end
end
