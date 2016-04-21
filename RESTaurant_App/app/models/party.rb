class Party < ActiveRecord::Base
  belongs_to :user
  belongs_to :table
  has_many :customers
end
