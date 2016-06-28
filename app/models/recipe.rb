require 'open-uri'
require 'nokogiri'
require "#{Rails.root}/lib/parser_class_selector"

class Recipe < ActiveRecord::Base

  belongs_to :list
  has_and_belongs_to_many :ingredients

  before_create :parse_recipe

  def parse_recipe
    recipe_doc = Nokogiri::HTML(open(self.url))
    parser_class = ParserClassSelecter.new(self.url, recipe_doc).parser_class
    ingredients = parser_class.new(recipe_doc).parse_ingredients

    build_ingredients(ingredients)
  end

  def build_ingredients(ingredients)
    ingredients.each do |ingredient|
      self.ingredients.build(name: ingredient)
    end
  end
end