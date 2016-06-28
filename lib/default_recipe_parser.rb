class DefaultRecipeParser < RecipeParser
  def self.can_parse?(domain, html)
    true
  end

end