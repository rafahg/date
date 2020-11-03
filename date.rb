require 'date'

class User
    attr_reader :name, :date_of_birth
    
    def initialize(name, date_of_birth)
        @name = name 
        @date_of_birth = date_of_birth
    end
    
    def age 
      year = Date.today.year - date_of_birth.year
      if Date.today.month >= date_of_birth.month && Date.today.day >= date_of_birth.day
        return year 
      else  
        return year - 1
      end
    end
    
    def next_birthday
        next_year = Date.today.year + 1
        if Date.today.month >= date_of_birth.month && Date.today.day >= date_of_birth.day
          Date.new(next_year, date_of_birth.month, date_of_birth.day)
        else  
          Date.new(Date.today.year, date_of_birth.month, date_of_birth.day)
        end
    end 
end

tests = [
    Date.new(1986, 1, 1),
    Date.new(1988, Date.today.month, Date.today.day),
    Date.new(1990, 12, 30),
    ]

puts "======= ages ========"

tests.each do |date|
    puts "#{date} => #{User.new("Test", date).age}"
end

puts "======== birthdays ========"

tests.each do |date|
    puts "#{date} => #{User.new("Test", date).next_birthday}"
end