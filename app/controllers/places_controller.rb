class PlacesController < ApplicationController
before_action :require_login, except: [:public_homepage]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if current_user
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
    else
      @entries = [] 
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
