# frozen_string_literal: true

require 'json'

notes = [
  { title: 'Investing retro', text: 'I wish I had invested in bitcoin when it was worth 500$' },
  { title: 'Investing retro (2)', text: 'I wish I had never stopped my bitcoin farm.' },
  { title: 'Investing retro (3)', text: "I wish I hadn't bought bitcoin at 13k, to then sell at 4k" },
  { title: 'Investing retro (4)', text: 'I wish I had sold my 8 ETH when it was at 700$ instead of 100$' }
]

File.open('notes.json', 'w').write(notes.to_json)
