class DosesController < ApplicationController
  def new
    # we need @dose in our `simple_form_for`
    @dose = Dose.find(params[:id])
  end


  def show
    @dose = Dose.find(params[:id])
  end
end
