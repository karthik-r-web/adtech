# # "#{class ProductsController < ApplicationController
# #   def index
# #     render json: Product.all
# #   end
# #
# # end
# #
# #
# #
# # Strings are mutable or not?
# #
# # Numbers and boolean values are mutable or not?
# #
# # How GC works in Ruby? (rather question for a senior dev)
# #
# # What are the differences between active record: joins, preload, includes and eager_load?
# #
# # How to achieve multiple inheritance in Ruby?
# #
# # What is the difference between include and extend in Ruby?
# #
# # What is the difference between Thread and Fiber?
# #
# # What is the difference between Proc and Lambda?
# #
# # How does Ruby handle exceptions?
# #
# # Name some modules of RoR framework? (ActiveRecord, ActionController, ActiveModel, etc.)
# #
# # What are the differences between public, private, and protected methods in Ruby?
# #
# #
# # 1- What is Rack and middlewares?
# # 2- What is n+1 and how to prevent it?
# # 3- What do you think about concerns and when should we take some code out in a concern?
# # 4- When would you prefer HABTM over HMT
# # 5- Basic DB schema design for the live coding round.
# #   6- Controller hooks
# # 7- Routing
# # 8- Class variables vs instance variables.
# #
# #
# #
# #
# #
# #   What is convention over configuration?
# #
# # What is the difference between `save` and `save!`?
# #
# #                                             What is a scope?
# #
# # What is the difference between `has_one` and `belongs_to`?
# #
# #                                                How do you handle database migrations in Rails?
# #
# #                                                What is `ActiveRecord`?
# #
# #                                                          What are callbacks?
# #
# #                                                What is MVC?
# #
# #                                                What is mass assignment?
# #
# #                                                Follow-up: How do you protect your app against that?
# #
# #                                                  What is CSRF?
# #
# #                                                  Follow-up: How is that handled in Rails?
# #
# #                                                  # Eager loading reviews along with movies
# #                                                  movies = Movie.includes(:reviews).all
# #
# #                                                  # Now, accessing movie.reviews will not trigger new queries
# #                                                  movies.each do |movie|
# #                                                    movie.reviews.each do |review|
# #                                                      puts review.content
# #                                                    end
# #                                                    # Initial query to fetch all movies
# #                                                    movies = Movie.all
# #
# #                                                    # N separate queries to fetch reviews for each movie
# #                                                    movies.each do |movie|
# #                                                      movie.reviews.each do |review|
# #                                                        puts review.content
# #                                                      end
# #                                                    end              end
# #
# #
# #                                                  products = Product.all #1query
# #                                                  products.each do |product|
# #                                                    product.variants.each do |variant| #n+1 query
# #                                                      puts variant.content
# #                                                    end
# #                                                  end
# #
# #
# #                                                  products = Product.includes(:variants).all
# #
# #                                                  mass assignment
# #
# #                                                  User.new(name: "Alice", email: "alice@example.com", admin: false)
# #                                                    }"
# #
# #
# #
# #
# #                                                  What is Ruby and why is it considered an object-oriented language?
# #
# #                                                  Explain the difference between include and extend in Ruby modules.
# #
# #                                                    What are blocks, procs, and lambdas in Ruby? How do they differ?
# #
# #                                                  How does garbage collection work in Ruby?
# #
# #                                                  What is the difference between a symbol and a string in Ruby?
# #
# #                                                  How do you handle exceptions in Ruby? Explain with examples.
# #
# #                                                    What are mixins in Ruby? How do they work?
# #
# #                                                  Explain the concept of duck typing in Ruby.
# #
# #                                                      How do you manage memory in Ruby?
# #
# #                                                    What are Ruby symbols, and why are they used instead of strings in some cases?
# #
# #                                                    Explain the difference between == and === in Ruby.
# #
# #                                                        How do you implement inheritance in Ruby?
# #
# #                                                      What are singleton methods in Ruby? How are they used?
# #
# #                                                      Describe how method_missing works in Ruby.
# #
# #                                                          What is the use of yield in Ruby methods?
# #
# #                                                      How do you create and use modules in Ruby?
# #
# #                                                      Explain the difference between class variables, instance variables, and global variables.
# #
# #                                                        How do you test if an object is of a certain type/class in Ruby?
# #
# #                                                      Write a Ruby method to reverse a string without using built-in reverse methods.
# #
# #                                                          Explain how Ruby's Enumerable module works with some examples.
# #
# #
# # Latest course ruby on rails
# # ai with ruby on rails
# #
#
#
# How does ruby handlde method lookup?
#
# Lambda
#
# Blocks, proc, lambda
#
# difference
#
# ruby test
#
# test cases. Unil test
#
# Symbols
#
# Strings
#
# How is wiritng codee for Mongo diff than ActiveRecord?
#
# Elasticsearch
#
# When to use ruby sidd query and elasticsearch?
#
# JSON files, serilaisation
#
# DuringnAPI call
#
# garbage collection
#
# ruby



class ProductsController < ApplicationController
  def index
    render json: {}
  end

  def create
    @v = Product.new(variant_params)
    @v.save
  end

  private
  def variant_params
    params.permit(:name, :price)
  end

end