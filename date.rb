require 'date'

class User
    attr_reader :name, :date_of_birth
    
    def initialize(name, date_of_birth)
        @name = name 
        @date_of_birth = date_of_birth
    end
    
    def age 
      actual_date = Date.today
      current_year = Date.today.year
     p years = current_year - date_of_birth.year
      ((actual_date.month > date_of_birth.month || (actual_date.month == date_of_birth.month && actual_date.day >= date_of_birth.day)) ? years : years -=1)
      years

    end
    
    def next_birthday
      now = Date.today
      year = Date.today.year 
      ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? year +=1 : year)
      Date.new(year, date_of_birth.month, date_of_birth.day)

    end 
end

tests = [
    Date.new(1990, 11, 4),
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