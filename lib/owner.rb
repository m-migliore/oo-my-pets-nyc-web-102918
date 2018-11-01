require "pry"
require_relative "./cat"
require_relative "./dog"
require_relative "./fish"

class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {
      :cats=>[],
      :dogs=>[],
      :fishes=>[]
    }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    dogs = self.pets[:dogs]
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    cats = self.pets[:cats]
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    fishes = self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |species, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end

    self.pets.clear
  end

  def list_pets
    fish_count = self.pets[:fishes].count
    dog_count = self.pets[:dogs].count
    cat_count = self.pets[:cats].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end






end
