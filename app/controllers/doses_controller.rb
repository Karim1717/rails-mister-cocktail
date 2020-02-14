class DosesController < ApplicationController
  def new
    # we need @dose in our `simple_form_for`
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  # def index
  #   @doses = Dose.all
  # end

  # def show
  #   @dose = Dose.find(params[:id])
  # end

  def create
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      if @dose.save
        redirect_to cocktail_path(@cocktail)
      else
        render "cocktails/show"
      end
    end

  # def edit
  #   @dose = Dose.find(params[:id])
  # end

  # def update
  #   @dose = Dose.find(params[:id])

  #   # Will raise ActiveModel::ForbiddenAttributesError
  #     if @dose.update(dose_params)
  #       redirect_to doses_path
  #     else
  #       render 'edit'
  #     end
  # end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/doses/destroy.html.erb
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
