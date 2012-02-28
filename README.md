ActsAsPositioned
================

ActsAsPositioned is a featherweight gem for keeping records organized by position. We wrote it because keeping slideshow slides organized in RailsAdmin and Typus was frustrating. Stuff should just go where you put it.

ActsAsPositioned borrows much from ActsAsList, but does less and is more useful in today's Rails 3 universe.


Requirements
------------

1. You are using Rails 3.1 or higher.
2. You have defined an integer "position" field on your model.


Installation
------------

Add this to your gemfile:

    gem 'acts_as_positioned', :git => "git://github.com/AllDayEveryday/acts_as_positioned.git"

Run <code>bundle install</code>.


Usage
-----------

Call <code>acts_as_positioned</code> in your models.

### Basic

    class Slide < ActiveRecord::Base
      # this is the good bit:
      acts_as_positioned 

      # remember to order by position, either here or in your controllers.
      default_scope order(:position)
    end


  
### Scoped

If positions aren't unique -- suppose you're organizing 24 songs under 2 albums -- supply an <code>:under</code> option.

    class Song < ActiveRecord::Base
      belongs_to :album  
      acts_as_positioned :under => :album
    end



Questions?
----------
Write to info@alldayeveryday.com.
