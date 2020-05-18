class String
  def to_2000
    self.split("").each do |c|
      should_upcase = rand < 0.5
      c.upcase! if should_upcase
      c.downcase! unless should_upcase
    end.join("")
  end
end

# Logs
=begin
"Hola, como estas? -> HoLa, CoMo EsTaS?
"Porque escribes de esa manera? -> PoRqUe EsCrIbEs De EsA mAnEra?
"What is wrong with you? -> WhAt Is WrOnG wItH yOu?
=end
