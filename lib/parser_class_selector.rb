require 'recipe_parser'
require "schema_org_recipe_parser"
require 'default_recipe_parser'

class ParserClassSelecter
  def initialize(domain, html)
    @domain = domain
    @html = html
  end

  def parser_class
    parser_classes = [
      SchemaOrgRecipeParser,
      DefaultRecipeParser
    ]
    parser_classes.detect { |p| p.can_parse?(@domain, @html) }
  end

end