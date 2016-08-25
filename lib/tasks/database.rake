# source link http://stackoverflow.com/a/7792243/3871015
namespace :db do
  desc "Truncate all existing data"
  task :truncate => "db:load_config" do
   begin
    config = ActiveRecord::Base.configurations[::Rails.env]
    ActiveRecord::Base.establish_connection
    case config["adapter"]
      when "mysql", "postgresql"
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.execute("TRUNCATE #{table}") if table != "schema_migrations"
        end
      when "sqlite", "sqlite3"
        ActiveRecord::Base.connection.tables.each do |table|
          ActiveRecord::Base.connection.execute("DELETE FROM #{table}") if table != "schema_migrations"
          ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence where name='#{table}'") if table != "schema_migrations"
        end                                                                                                                               
       ActiveRecord::Base.connection.execute("VACUUM")
     end
    end
  end
end
