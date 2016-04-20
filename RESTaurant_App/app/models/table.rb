class Table < ActiveRecord::Base
  belongs_to :user
  has_many :customers
end
