#load './binary_tree.rb'

class Node

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end


class BinaryTree

  attr_accessor :root

  def initialize(data, node)
    if node.nil?
      @root = Node.new data
    else
      @root = node
    end
  end


  def inorder(node = root)
    if !node.left.nil?
      inorder(node.left)
    end

    p node.data

    if !node.right.nil?
      inorder(node.right)
    end

  end

  def preorder(node = root)
    p node.data

    if !node.left.nil?
      preorder(node.left)
    end

    if !node.right.nil?
      preorder(node.right)
    end

  end

  def postorder(node = root)
    if !node.left.nil?
      postorder(node.left)
    end

    if !node.right.nil?
      postorder(node.right)
    end

    p node.data
  end

  def height(node = root)
    if node.nil?
      return 0
    end

    lheight = height(node.left)
    rheight = height(node.right)

    if lheight < rheight
      rheight + 1
    else
      lheight + 1
    end
  end


  def bfs
    (1..height).each do |level|
      arr = print_given_level(root, level, [])
      p arr.collect(&:to_s).join(' , ')
    end
  end

  def print_given_level(node, level, array)
    if node.nil?
      return
    end

    if level == 1
      array << node.data
    end

    if level > 1
      print_given_level(node.left, level - 1, array)
      print_given_level(node.right, level - 1, array)
    end

    array
  end

  def inorder_without_recursion(node = root)
    array = []
    array.push node

    while(!array.empty?)
      p array.collect(&:data)
      p "--------"
      node = node.left

      while(!(node).nil?)
        array.push node
        node = node.left
      end

      node = array.pop
      p node.data

      if !node.right.nil?
        node = node.right
        array.push node
      end

    end
  end


  def size(node = root)
    if node.nil?
      return 0
    else
      p node.data
    end    

    size(node.left) + 1 + size(node.right) 
  end


  def self.identical(node1, node2)
    if node1.nil? and node2.nil?
      return true
    elsif node1.nil? or node2.nil?
      return false
    end

    if node1.data == node2.data
      p identical(node1.left, node2.left) and identical(node1.right, node2.right)
    else
      return false
    end
  end

  def mirror_image(node = self.root)
    if node.nil?
      return
    end

    mirror_image(node.left)
    mirror_image(node.right)

    temp = node.left
    node.left = node.right
    node.right = temp
  end

  def root_to_leaf_paths(array, node = root)
    # reached leaf
    if node.nil?
      return
    end

    array.push(node)

    if node.left.nil? and node.right.nil?
      p array.collect(&:data).join(' -> ')

      while(node.right.nil? or array.include?(node))
        node = array.pop
      end
    end
    
    if !node.left.nil?
      root_to_leaf_paths(array, node.left)
    end

    if !node.right.nil?
      root_to_leaf_paths(array, node.right)
    end
  end

  def children_sum_property(node = self.root)
    if node.nil? or (node.left.nil? and node.right.nil?)
      return true
    end

    children_sum_property(node.left) and children_sum_property(node.right)

    left_data = !node.left.nil? ? node.left.data : 0
    right_data = !node.right.nil? ? node.right.data : 0

    node.data == left_data + right_data
  end

  def convert_to_children_sum_property(node = self.root)
    if node.nil? or (node.left.nil? and node.right.nil?)
      return
    end

    convert_to_children_sum_property(node.left)
    convert_to_children_sum_property(node.right) 

    left_data = !node.left.nil? ? node.left.data : 0
    right_data = !node.right.nil? ? node.right.data : 0

    node.data = left_data + right_data
  end

  def diameter(node = self.root, count = 0)
    if node.nil?
      return 0
    end

    ldiameter = diameter(node.left)
    rdiameter = diameter(node.right)

    if ldiameter < rdiameter
      rdiameter + 1
    else
      rdiameter + 1
    end
  end



  # def root_to_leaf_path_sum(sum)
  #   array = []
  #   root_to_leaf_path(root, array, sum)
  # end

  # def root_to_leaf_path(node, array, sum)
  #   if node.nil?
  #     return
  #   end

  #   if node.left.nil? and node.right.nil?

  #     p array.collect(&:data).join(' -> ')
  #   end

  #   root_to_leaf_path
  # end 


  def self.build_tree(b, in_arr, pre_arr, start_index, end_index, pre_index = 0)
    if start_index > end_index
      return nil
    end

    element = pre_arr[pre_index]
    
    if pre_index == 0
      b = BinaryTree.new element
      node = b.root
    else
      node = Node.new element
    end
    
    pre_index += 1
    in_index = in_arr.index(element)

    if start_index == end_index
      return node
    end

    node.left = build_tree(in_arr, pre_arr, start_index, in_index - 1, pre_index)
    node.right = build_tree(in_arr, pre_arr, in_index + 1, end_index, pre_index)

    return node
  end

  
  def print_root_to_leaf_path(array = [], node = root)
    root_to_leaf_path(array, node, 0)
  end


  def root_to_leaf_path(array, node, path_length)
    if node.nil?
      return 
    end

    array[path_length] =  node

    p "Node data - " +  node.data.to_s

    p "============"
    p path_length += 1
    p "============"

    if node.left.nil? and node.right.nil?
      p array.collect(&:data).join(' -> ')
    else
      root_to_leaf_path(array, node.left, path_length)
      root_to_leaf_path(array, node.right, path_length)
    end
  end


  def double_tree(node = self.root)
    if node.nil?
      return
    end

    double_tree(node.left)
    double_tree(node.right)

    if !node.left.nil?
      temp = node.left
    else
      temp = nil
    end
    node.left = Node.new(node.data)

    if !temp.nil?
      node.left.left = temp      
    end
  end

  def max_width(node = self.root, level = 0, hash = {})
    if node.nil?
      return
    end

    level += 1
    hash[level] = hash[level].nil? ? 1 : hash[level] + 1

    max_width(node.left, level, hash)
    max_width(node.right, level, hash)

    max = hash.values.max
    hash.select { |k, v| v == max}
  end

  # TODO
  def is_foldable

  end

  def nodes_at_distance(distance, node = self.root, level = 0)
    if node.nil?
      return
    end

    level += 1

    if level == distance
      p node.data
    end

    nodes_at_distance(distance, node.left, level)
    nodes_at_distance(distance, node.right, level)
  end

  def key_level(key, node = self.root, level = 0)
    if node.nil?
      return
    end

    level += 1

    if node.data == key
      p level
    else
      key_level(key, node.left, level)
      key_level(key, node.right, level)
    end
  end

  def print_ancestors(key, node = self.root, array = [], level = 0)
    if node.nil?
      return
    end
    
    array[level] = node.data
    level += 1
  
    if node.data == key
      array.each_with_index { |element, index| p element if index < (level - 1)}
      return
    else
      print_ancestors(key, node.left, array, level)
      print_ancestors(key, node.right, array, level)
    end
  end

  def vertical_sum(node = self.root, hash = {}, index = 0)
    if node.nil?
      return
    end

    if hash[index].nil?
      hash[index] = node.data
    else
      hash[index] += node.data
    end

    vertical_sum(node.left, hash, index - 1)
    vertical_sum(node.right, hash, index + 1)

    return Hash[hash.sort_by{|k,v| k}].values
  end

  def max_sum_root_to_leaf_path(array = [], index = 0, node = self.root, max_sum = 0)
    if node.nil?
      return
    end

    #return if !array[index].nil? and array[index] > node.data
    
    array[index] = node.data
    
    p index
    sum = array[0..index].inject(:+)     
    p max_sum = max_sum < sum ? sum : max_sum

    p "--------"
    index += 1

    max_sum_root_to_leaf_path(array, index, node.left, max_sum)
    max_sum_root_to_leaf_path(array, index, node.right, max_sum)

    return array
  end


  def self.build_special_tree_from_inorder_traversal(inorder_array, start_index = 0, end_index = inorder_array.length - 1)
    if end_index <  start_index
      return
    end    

    
    max_element = inorder_array[start_index..end_index].max
    
    p start_index
    p end_index
    p max_element
    p "========================="
    node = Node.new max_element

    if start_index == end_index
      return node
    end

    index = inorder_array.index(max_element)
    p "==========="
    node.left = build_special_tree_from_inorder_traversal(inorder_array, start_index, index - 1)
    p index
    node.right = build_special_tree_from_inorder_traversal(inorder_array, index + 2, inorder_array.length - 1)

    return node

  end

  def build_special_tree

  end

  def self.is_subtree(pre_array, sub_pre_array, subindex = 0, preindex = nil)
    if sub_pre_array[subindex].nil?
      return true
    end

    if preindex.nil?
      preindex = pre_array.index(sub_pre_array[subindex])
    end
  

    if !preindex.nil?
      pre_array[preindex] == sub_pre_array[subindex] and is_subtree(pre_array, sub_pre_array, subindex + 1, preindex + 1)
    else
      p "#{sub_pre_array[subindex]} is not found in #{pre_array}"
      return false
    end
  end



  # TODO : To be fixed.. Bored for now.
  def is_complete
    bool = true
    (1..height).each do |level|
      bool = check_if_complete(root, level)
      break if !bool
    end

    bool
  end

  def check_if_complete(node, level)
    if node.nil?
      return true
    end

    if level == 1
      return ((node.left.nil? and node.right.nil?) or (!node.left.nil? and !node.right.nil?) or (!node.left.nil?))
    end

    if level > 1
      check_if_complete(node.left, level - 1) and check_if_complete(node.right, level - 1)      
    end
  end

  def boundary_traversal
    array = [root.data]
    array << print_left_boundary(root.left, array)

    p array
  end

  def print_left_boundary(node, array)

    p node
    array << node.data 
    
    if !node.left.nil?
      print_left_boundary(node.left, array)
    end
  end


  def self.dummy_tree
    b = BinaryTree.new 1
    root = b.root
    root.left = Node.new 2
    root.right = Node.new 3
    root.left.left = Node.new 4
    root.left.right = Node.new 5
    root.left.right.left = Node.new 6
    
    root.right.left = Node.new 7
    root.right.left.left = Node.new 8
    root.right.left.right = Node.new 9
    
    root.left.left.right = Node.new 10

    b
  end

end