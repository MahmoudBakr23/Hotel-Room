class RoomsController < ApplicationController
  def index
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    if @start_date.present? && @end_date.present?
      start_date = Date.parse(@start_date)
      end_date = Date.parse(@end_date)

      reserved_room_ids = reserved_room_ids_for_range(@start_date, @end_date)
      @available_rooms = Room.where.not(id: reserved_room_ids)
    else
      @available_rooms = Room.all
    end
  end

  def show
    @room = Room.find(params[:id])
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @reservation = Reservation.new(room: @room, start_date: @start_date, end_date: @end_date)
  end

  private

  def reserved_room_ids_for_range(start_date, end_date)
    Reservation.where(start_date: start_date..end_date).pluck(:room_id)
  end

end
