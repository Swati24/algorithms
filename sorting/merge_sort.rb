require_relative 'base_sort.rb'

class MergeSort

  def self.process(array = nil)
    length = array.length
    return array if length == 1

    mid_index = get_mid_index(length)
    l1 = array[0..mid_index]
    l2 = array[mid_index + 1..length - 1]

    p l1 = process(l1)
    p l2 = process(l2)

    p "Sorting List"
    p l1 = sorted_merge(l1, l2)
  end

  def self.sorted_merge(a1, a2, index = 0, index1 = 0, index2 = 0, temp = [])
    if index1 > a1.length or index2 > a2.length or (a2[index2].nil? and a1[index1].nil?)
      return temp
    end

    if a1[index1].nil?
      temp[index] = a2[index2]
      index2 += 1
    elsif a2[index2].nil?
      temp[index] = a1[index1]
      index1 += 1
    elsif a1[index1] < a2[index2]
      temp[index] = a1[index1]
      index1 += 1
    else
      temp[index] = a2[index2]
      index2 += 1
    end

    sorted_merge(a1, a2, index + 1, index1, index2, temp)
  end

  def self.get_mid_index(l)
    l % 2 == 0 ? (l/2) - 1 : (l - 1)/2
  end


  def self.run
    MergeSort.process([38, 27, 43, 3, 9, 82, 10])
  end

end

