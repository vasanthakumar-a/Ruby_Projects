class Node
	attr_accessor :value, :left, :right
	def initialize(value)
		@value = value
		@left, @right = nil, nil
	end
end

def pushNode(node, value)
  if(value > node.value)
   if(node.right)
    pushNode(node.right, value)
   else
    node.right = Node.new(value)
   end
  else
   if(node.left)
    pushNode(node.left, value)
   else
    node.left = Node.new(value)
   end
  end
end

def invert_tree(root)
	return nil if root.nil?
	tmp = root.left
	root.left = invert_tree(root.right)
	root.right = invert_tree(tmp)
	return root
end

def traverse (node)
  if(node==nil)
   return
  end
  if(node.left)
   traverse(node.left)
  end
   print node.value," "
  if(node.right)
   traverse(node.right)
  end
end

arr = [5,6,2,4,1,8,7,9,3]
root = Node.new(arr.shift)
arr.each{|e| pushNode(root, e) }

puts "Before Invert  : "
traverse(root)
puts
puts
p invert_tree(root)
puts
puts "After Invert  : "
traverse(root)
