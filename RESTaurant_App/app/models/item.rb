class Item < ActiveRecord::Base
  belongs_to :itype
  has_many :orders
  has_many :customers, through: :orders
end
