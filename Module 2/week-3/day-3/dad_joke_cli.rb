# frozen_string_literal: true

require 'http'

puts HTTP.headers('user-agent'.to_sym => 'https://github.com/kucho/Module 2',
               :accept => 'text/plain')
      .get('https://icanhazdadjoke.com/').body
