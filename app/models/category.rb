class Category < ActiveRecord::Base
  validates_inclusion_of :name, in: ['Hello12','Entertainment', 'Learning', 'Everything Else']
  validates_uniqueness_of :name
end
