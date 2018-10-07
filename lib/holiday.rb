require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |seasons, data|
    if seasons == season
      holiday_hash[season] = {holiday_name => supply_array}
    end
  end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  return holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  new_holiday = []
  holiday_a = []

  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:"
    holiday.each do |name, supply|
      name_output = name.to_s.split("_")
      name_output.map! {|word| word.capitalize}
      name_output = name_output.join(" ")

      supplies_output = supply.join(", ")

      puts "  #{name_output}: #{supplies_output}"
    end
  end
end


def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  empty = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supply|
      empty << holiday if supply.include?("BBQ")
    end
  end
  return empty
end
