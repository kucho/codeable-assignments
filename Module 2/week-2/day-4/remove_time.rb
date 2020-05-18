# frozen_string_literal: true

def shorten_to_date(long_date)
  long_date.gsub(/,.+$/, '')
end
