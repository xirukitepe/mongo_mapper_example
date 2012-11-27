MongoMapper.connection =
Mongo::Connection.new('localhost',27017)
#Mongo::Connection.new('localhost',7952)
MongoMapper.database = "#expense-#{Rails.env}"

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    MongoMapper.connection.connect if forked

  end
end
