def rgb_detector(sample)
  red_pixels = []
  sample.each do |e|
    e.each { |i| red_pixels << i if is_red(i[0], i[1], i[2]) }
  end
  red_pixels.size
end

def is_red(r, g, b)
  return false if r < 100
  mark = r / 4
  g < mark && b < mark
end

sample = [[[65, 67, 23], [234, 176, 0], [143, 0, 0]],
          [[255, 30, 51], [156, 41, 38], [3, 243, 176]],
          [[255, 255, 255], [0, 0, 0], [133, 28, 13]],
          [[26, 43, 255], [48, 2, 2], [57, 89, 202]]]

puts rgb_detector(sample)