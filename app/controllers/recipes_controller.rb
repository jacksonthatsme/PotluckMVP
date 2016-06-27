class RecipesController < ApplicationController

  private
    def recipe_params
      params.require(:recipe).permit(:id, :list_id, :url)
    end

end
