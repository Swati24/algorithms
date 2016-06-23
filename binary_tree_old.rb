# class Node

#   attr_accessor :data, :left, :right

#   def initialize data
#     @data = data
#     @left = nil
#     @right = nil
#   end

# end

# class BinaryTree

#   attr_accessor :root

#   def initialize data
#     @root = Node.new data
#   end

#   def inorder(node = self.root)
#     if node.left
#       inorder node.left
#     end

#     p node.data

#     if node.right
#       inorder node.right
#     end
#   end

#   def preorder(node = self.root)
#     p node.data

#     if node.left
#       preorder node.left
#     end

#     if node.right
#       preorder node.right
#     end
#   end

#   def postorder(node = self.root)
#     if node.left
#       postorder node.left
#     end

#     if node.right
#       postorder node.right
#     end

#     p node.data
#   end

#   def level_order_traversal
#     (1..self.height).each do |level|
#       print_level_order_node self.root, level
#       p "----------"
#     end
#   end

#   def print_level_order_node node, level
#     return if node.nil?

#     if level == 1
#       p node.data 
#     elsif level > 1
#       print_level_order_node node.left, level - 1
#       print_level_order_node node.right, level - 1
#     end
#   end

#   def height(node = self.root)
#     if node.nil?
#       return 0
#     end

#     lheight = height node.left
#     rheight = height node.right

#     if lheight > rheight
#       return lheight + 1
#     else
#       return rheight + 1
#     end
#   end


#   def children_sum_property(node = self.root)
#     if node.nil? or node.left.nil? and node.right.nil?
#       p '----Case 1----'
#       p node.data
#       return true
#     elsif !node.left.nil? or !node.right.nil?
#       p '----Case 3----'
#       p left = node.left.data rescue 0
#       p right = node.right.data rescue 0
#       p (node.data == left + right) and children_sum_property(node.left) and children_sum_property(node.right)
#     end
#   end

#   def convert_to_children_sum_property_tree(node = self.root)
#     if node.nil? or (node.left.nil? and node.right.nil?)
#       return
#     else
#       if node.left
#         convert_to_children_sum_property_tree node.left
#       end

#       if node.right
#         convert_to_children_sum_property_tree node.right
#       end

#       node.data = (node.left.data rescue 0) + (node.right.data rescue 0)
#     end

#     self.inorder
#   end

#   def height_balanced?(node = self.root)
#     if node.nil? or (node.right.nil? and node.left.nil?)
#       return true
#     elsif ((height(node.left) - height(node.right)).abs <= 1)
#       (height_balanced?(node.left) and height_balanced?(node.right))
#     else
#       return false
#     end
#   end


#   def root_leaf_path_equals_sum(sum, node = self.root)
#     p sum
#     if node.nil?
#       return 0
#     end
    
#     sum = sum - node.data
#     if (sum) == 0
#       p 'lalalalalalala'
#       p node.data
#       return true
#     else
#       lsum = root_leaf_path_equals_sum(sum, node.left)
#       rsum = root_leaf_path_equals_sum(sum, node.right)
#     end
#   end

#   def print_root_to_node_path(node = self.root, paths_array = [])
#     if node.nil?
#       return
#     end

#     paths_array << node.data

#     if node.left.nil? and node.right.nil?
#       printArray(paths_array)
#     else
#       print_root_to_node_path(node.left, paths_array.dup)
#       print_root_to_node_path(node.right, paths_array.dup)
#     end

#   end

#   def printArray(paths_array)
#     (0..paths_array.length).each do |index|
#       p paths_array[index]
#     end
#   end

#   def generate_double_tree(node = self.root)
#     if node.left
#       generate_double_tree(node.left)
#     end

#     if node.right
#       generate_double_tree(node.right)
#     end

#     temp = Node.new node.data

#     unless node.left.nil?
#       temp.left = node.left
#       node.left = temp
#     else
#       node.left = temp
#     end
#   end

#   def get_max_width(hash = {}, node = self.root, level = 1)
#     if node.nil?
#       return 
#     end

#     hash[level] = hash[level].nil? ? 1 : hash[level] + 1
#     level += 1
    
#     get_max_width(hash, node.left, level)
#     get_max_width(hash, node.right, level)

#     hash.values.max
#   end

#   def mirror(node = self.root)
#     if node.nil?
#       return
#     end

#     mirror(node.left)
#     mirror(node.right)

#     temp = node.left
#     node.left = node.right
#     node.right = temp
#   end

#   def get_level_of_node(value, node = self.root, level = 1)
#     if node.nil?
#       return 0
#     end

#     if node.data == value
#       return level 
#     end

#     downlevel = get_level_of_node(value, node.left, level + 1)
#     if downlevel != 0
#       return downlevel
#     end
#     downlevel = get_level_of_node(value, node.right, level + 1)
#     return downlevel
#   end

#   def print_ancestors(value, node = self.root, ancestors_path = [])
#     if node.nil?
#       return []
#     end

#     if node.data == value
#       return ancestors_path
#     end
#     ancestors_path << node.data

#     s_ancestors_path = print_ancestors(value, node.left, ancestors_path.dup)
#     unless s_ancestors_path.empty?
#       return s_ancestors_path
#     end
#     s_ancestors_path = print_ancestors(value, node.right, ancestors_path.dup)
#     return s_ancestors_path
#   end

#   def is_sum_tree?(node = self.root, sum = 0)
#     if node.nil?
#       return 0
#     else
#       p node.data
#       p ltree = is_sum_tree?(node.left, node.data)
#       p rtree = is_sum_tree?(node.right, node.data)
#     end

#       # sum == node.data and (is_sum_tree?(node.left, sum) and is_sum_tree?(node.right, sum))
#       # p sum = sum + node.data
#       # p node.data
#       # p '-----------'
#   end


#   def self.create_dummy
#     b = BinaryTree.new 1
#     root = b.root
#     root.left = Node.new 2
#     root.right = Node.new 3
#     root.left.left = Node.new 4
#     root.left.right = Node.new 5

#     b
#   end
# end

