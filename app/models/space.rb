require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Integer
  property :start_date, Date
  property :end_date, Date

  belongs_to :user

  has n, :requests
  has n, :bookings

end
