require 'active_record'
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

ActiveRecord::Migration.create_table :whatevers do |t|
  t.string :name
  t.timestamps
end
