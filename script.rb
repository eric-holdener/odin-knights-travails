def knight_moves(start_loc, end_loc)
  stack = []
  stack.push(start)
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

start_loc = [0, 0]
end_loc = [1, 2]

get_children(start_loc)
