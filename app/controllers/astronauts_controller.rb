class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @missions = Mission.order_by_title
  end
end
