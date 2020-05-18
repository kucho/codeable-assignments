# frozen_string_literal: true

require 'textstat'

def reading_grade(text)
  grade = TextStat.coleman_liau_index(text)
  _result = if grade < 1 then 'Before Grade 1'
            elsif grade < 16 then "Grade #{grade}"
            else 'Grade 16+'
            end
end
