class Customer < ActiveRecord::Base
  belongs_to :party
  has_many :orders
  has_many :items, through: :orders
end
