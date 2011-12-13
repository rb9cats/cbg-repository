class OrderTransaction < ActiveRecord::Base
  belongs_to :order
  belongs_to :artist
end
