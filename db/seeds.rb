puts 'Cleaning database...'
Pillow.destroy_all

puts 'Creating Pillows...'
pillows_attributes = [
  {
    address:      '7 Boundary St, London E2 7JE',
    category:     'chinese',
  },
  {
    address:      '14 Apple St, London 8 34k',
    category:     'chinese',

  },
  {
    address:      '21 minis St, London E2 7JE',
    category:     'chinese',
  },
  {
    address:      '28 Fun St, London E2 7JE',
    category:     'chinese',
  },
  {
    address:      '35 Bound St, London E2 7JE',
    category:     'chinese',
  }
]
Pillow.create!(pillows_attributes)
puts 'Finished!'
