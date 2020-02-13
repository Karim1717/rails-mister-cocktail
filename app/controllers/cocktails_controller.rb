class CocktailsController < ApplicationController
  def new
    # we need @cocktail in our `simple_form_for`
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    # Will raise ActiveModel::ForbiddenAttributesError
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])

    # Will raise ActiveModel::ForbiddenAttributesError
      if @cocktail.update(cocktail_params)
        redirect_to cocktails_path
      else
        render 'edit'
      end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    # no need for app/views/cocktails/destroy.html.erb
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
