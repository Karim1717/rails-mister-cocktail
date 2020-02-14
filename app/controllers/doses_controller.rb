class DosesController < ApplicationController
  def new
    # we need @dose in our `simple_form_for`
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end
def create
    @dose = Dose.new(dose_params)

    # Will raise ActiveModel::ForbiddenAttributesError
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])

    # Will raise ActiveModel::ForbiddenAttributesError
      if @dose.update(dose_params)
        redirect_to doses_path
      else
        render 'edit'
      end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/doses/destroy.html.erb
    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:name, :description, :ingredient)
  end

end
