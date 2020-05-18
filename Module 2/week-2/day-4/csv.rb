# frozen_string_literal: true

require 'csv'

File.open('csv.csv', 'r') do |file|
  csv = CSV.read(file, headers: true, encoding: 'UTF-8')
  top = csv.sort_by { |row| -row[' Final'].to_f }.first(3)
  top.each_with_index do |row, index|
    str = "#{index + 1} %s with a score of %s"
    puts format(str, row[' First name'].strip, row[' Final'].strip)
  end
  puts
end
