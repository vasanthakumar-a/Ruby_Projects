tree = {
  "value" => 1,
  "left" => {
    "value" => 2,
    "left" => {
      "value" => 4,
      "left" => { "value" => 10 },
      "right" => { "value" => 11 },
    },
    "right" => {
      "value" => 5,
      "left" => { "value" => 12 },
      "right" => { "value" => 13 },
    },
  },
  "right" => {
    "value" => 3,
    "left" => {
      "value" => 6,
      "left" => { "value" => 14 },
      "right" => { "value" => 15 },
    },
    "right" => {
      "value" => 7,
      "left" => { "value" => 16 },
      "right" => { "value" => 17 },
    },
  }
}

def transpose(hash)
  hash.each do |key, value|
    if value.is_a?(Hash) and value['left'] and value['right']
      value['left'], value['right'] = value['right'], value['left']
      transpose(value)
    end
  end
end

print tree
puts
puts

transpose(tree)

tree['left'], tree['right'] = tree['right'], tree['left']

print tree
