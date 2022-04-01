def knight_moves(root, end_loc)
  return if root.nil?

  return [root, end_loc] if root == end_loc
  root = Node.new(root)
  queue = []
  visited = []
  queue.push(root)
  while queue.empty? == false
    data = queue[0]
    children = get_children(data.data)
    children.each do |value|
      child = Node.new(value, data)
      if child.data == end_loc
        return traceback(child)
      elsif visited.include?(child.data)
        next
      else
        queue.push(child)
      end
    end
    visited.push(data.data)
    queue.shift
  end
end

def traceback(node, moves = [])
  if node.parent.nil? == false
    moves.unshift(node.data)
    node = node.parent
    traceback(node, moves)
  else
    moves.unshift(node.data)
    display_final(moves)
  end
end

def get_children(node)
  children = []
  children.push([node[0] + 2, node[1] + 1])
  children.push([node[0] + 2, node[1] - 1])
  children.push([node[0] - 2, node[1] + 1])
  children.push([node[0] - 2, node[1] - 1])
  children.push([node[0] + 1, node[1] + 2])
  children.push([node[0] + 1, node[1] - 2])
  children.push([node[0] - 1, node[1] + 2])
  children.push([node[0] - 1, node[1] - 2])
  i = 0
  while i < children.length
    if children[i][0] > 7 || children[i][0].negative? || children[i][1] > 7 || children[i][1].negative?
      children.delete_at(i)
    else
      i += 1
    end
  end
  children
end

def display_final(moves)
  length = moves.length
  puts "You made it in #{length-1} moves! Heres your path:"
  i = 0
  while i < length
    p moves[i]
    i += 1
  end
end

class Node
  attr_accessor :data, :children, :parent
  def initialize(data, parent = nil)
    @data = data
    @parent = parent
  end
end

start_loc = [3, 3]
end_loc = [4, 3]

p knight_moves(start_loc, end_loc)
