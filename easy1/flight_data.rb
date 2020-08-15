class Flight
  attr_reader :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# I changed the attr_accessor for database_handler to
# a attr_reader only since one might want to retrieve the handle
# but changing it however one pleases with a default setter is
# dangerous.