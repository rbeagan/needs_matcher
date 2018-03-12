class UsersController < ApplicationController
  def index
    @users = User.all
    @location_hash = Gmaps4rails.build_markers(@users.where.not(:home_address_latitude => nil)) do |user, marker|
      marker.lat user.home_address_latitude
      marker.lng user.home_address_longitude
      marker.infowindow "<h5><a href='/users/#{user.id}'>#{user.email}</a></h5><small>#{user.home_address_formatted_address}</small>"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
