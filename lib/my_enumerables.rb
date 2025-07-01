module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |item|
      yield(item)
    end
  end

  #if any item is false from block, return false
  #if all block is traversed successfully, return true
  def my_all?
    self.each do |item|
      if yield(item)
      else
        return false
      end
    end
   return true
  end

  #returns true if any item is true from block condition
  def my_any?
    self.each do |item|
      if yield(item)
        return true
      end
    end
    return false
  end
#when not given a block returns size of enumerable
#when given a block returns count of element in block
  def my_count
    size = 0
    if block_given?
      self.each do |item|
        if yield(item)
          size += 1
        end
      end
      return size
    else
      return self.size()
    end
  end
#when not given a block returns original enumerable
#when given a block executes the block for each element and index
  def my_each_with_index
    i = 0
    if block_given?
      self.each do |item|
        yield(item, i)
        i += 1
      end
    end
    return self
  end

#reduces an enumerable to a single value
#can be used to calculate the product
#uses the initial value on the first iteration
  def my_inject(initial)
    sums = initial
    self.each do |item|
      sums = yield(sums, item)
    end
    sums
  end
#when given a block returns an array by yielding to the block
#when given a block returns an array with the same size as the enumerable
#when called with &:symbol returns an array callling the method that matches the symbol for each element
  def my_map
    arr = []
    my_each do |item|
        arr << yield(item)
    end
    arr
  end

  def my_none?
    my_each { |elem| return false if yield(elem) }
    true
  end

  def my_select
    new_array = []
    my_each { |elem| new_array << elem if yield(elem) }
    new_array
  end
end
