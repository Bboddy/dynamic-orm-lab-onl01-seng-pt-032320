require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  def self.table_name 
    "#{self.to_s.downcase}s"
  end
  
  def self.column_names
    sql = "pragma table_info('#{table_name}')"

    names = DB[:conn].execute(sql)
    names.map do |row|
      row["name"]
    end
  end
  
  def initialize(options={})
    options.each { |initialize, value|
      self.send("#{initialize}=", value)
    }
  end
  
  def table_name_for_insert
    self.class.table_name
  end
  
  def col_names_for_insert
    self.class.column_names.delete_if {|column| column == "id"}.join(", ")
  end
  
  def save
    sql = <<-SQL
      
    SQL
  end
end