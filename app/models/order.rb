class Order < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user  
  has_many :order_transactions
  attr_accessor :card_number, :card_verification_number

 
end
