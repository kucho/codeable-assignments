# frozen_string_literal: true

require 'json'

json_file = File.open('tasks.json') { |f| JSON.parse(f.read) }
json_file.each(&method(:puts))
