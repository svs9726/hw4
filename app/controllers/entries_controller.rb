require "open-uri"

class EntriesController < ApplicationController
before_action :require_login, only: ["new", "create"]

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    @entry = Entry.new
    @entry["user_id"] = current_user["id"]
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["image_url"] = params["image_url"]

    if params["uploaded_image"]
      @entry.uploaded_image.attach(params["uploaded_image"])
    end

    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
