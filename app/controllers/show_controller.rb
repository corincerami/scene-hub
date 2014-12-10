class ShowController < ApplicationController
  def index
    @shows = Show.all
  end

end
