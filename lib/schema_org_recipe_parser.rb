require 'nokogiri'

class SchemaOrgRecipeParser < RecipeParser

  def initialize(recipe_html)
    @doc = recipe_html
  end

  def self.can_parse?(domain, html)
    doc = html
    doc.css('[itemtype="http://schema.org/Recipe"]')
  end

  def parse_ingredients
    @doc.css(('[itemprop="ingredients"]')).map { |ingredient|
      # remove newlines and excess whitespace from ingredients
      ingredient
    }.reject(&:blank?)
  end  

  def parse
    ingredients = parse_ingredients(@doc)
  end
end