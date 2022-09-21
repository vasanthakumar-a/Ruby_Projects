# tree = { value: 1, left: { value: 2, left: { value: 4 }, right: { value: 5 }, }, right: { value: 3, left: { value: 6 }, right: { value: 7 }, } }

tree = {
  value: 1,
  left: {
    value: 2,
    left: { value: 4 },
    right: { value: 5 },
  },
  right: {
    value: 3,
    left: { value: 6 },
    right: { value: 7 },
  }
}

tree = tree.to_s

tree.gsub!("left","_l").gsub!("right","_r").gsub!("_l","right").gsub!("_r","left")

print tree
