require 'csv'
require 'pry'


class Car
 attr_reader :inventory_number, :make, :model, :year

  def initialize(args={})
    @inventory_number = args[:inventory_number]
    @make = args[:make]
    @model = args[:model]
    @year = args[:year]
  end
end


module CarLoader 
  def loader
    open_file = CSV.foreach(@file, headers: true, header_converters: :symbol) do |csv_row|
      @inventory << Car.new(csv_row)
    end
  end
end


class Dealership
  attr_reader :file, :inventory
  include CarLoader

  def initialize(file)
    @file = file
    @inventory = []
    loader
  end

  def list_cars
    list_num = 1
    @inventory.each do |car|
      puts "#{list_num}. #{car.inventory_number},  #{car.make},  #{car.model},  #{car.year}"
      list_num += 1
    end
  end

  def newest_car
    years = []
    @inventory.each do |car|
      years << car.year
    end
    newest = years.max
    @inventory.each do |car|
      if car.year.to_i == newest.to_i
        puts "The newest car is our #{car.make} #{car.model} from #{car.year}, with inventory ##{car.inventory_number}."
      end
    end
  end

  def cars_after(input_year)
    @inventory.each do |car|
      if car.year.to_i > input_year.to_i
        puts "#{car.inventory_number},  #{car.make},  #{car.model},  #{car.year}"
      end
    end
  end

  def cars_before(input_year)
    @inventory.each do |car|
      if car.year.to_i < input_year.to_i
        puts "#{car.inventory_number},  #{car.make},  #{car.model},  #{car.year}"
      end
    end
  end

  def find_make(input_make)
    find_results = []
    @inventory.each do |car|
      if car.make.downcase == input_make.downcase
        find_results << "#{car.inventory_number} #{car.make} #{car.model} #{car.year}"
      end
    end
    find_results
  end

end



dealership = Dealership.new("inventory.csv")
dealership.list_cars
dealership.newest_car
dealership.cars_after(2002)
dealership.cars_before(2002)
dealership.find_make("toyota")
dealership.find_make("tesla")


# if ARGV[0] == "find"
#   if ARGV[1] == "all"
#     # print all of the cars on Deano's lot
#     puts dealership.cars
#   elsif ARGV[1] == "make"
#     # print cars of the make supplied in ARGV[2]
#     puts dealership.find_make(ARGV[2])
#   elsif ARGV[1] == "pre"
#     # print cars made before the year supplied in ARGV[2]
#   elsif ARGV[1] == "post"
#     # print cars made after the year supplied in ARGV[2]
#   elsif ARGV[1] == "newest"
#     # print the newest car on the lot
#   end
# end
