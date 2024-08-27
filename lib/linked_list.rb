require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = node
    end
  end

  def prepend(value)
    node = Node.new(value, @head)
    @head = node    
  end

  def size
    return 0 if @head.nil?
    count = 1
    current = @head
    until current.next_node.nil?
      current = current.next_node
      count += 1
    end
    count
  end

  def head
    @head.value unless @head.nil?
  end

  def tail
    return nil if @head.nil?
      current = @head
      current = current.next_node until current.next_node.nil?
      current.value
  end
    
  def at(index)
    return nil if @head.nil?

    if index.zero?
      return @head.value
    end

    count = 0
    current = @head
    
    until count == index
      current = current.next_node
      count += 1
    end
    current.value
  end

  def pop
    return nil if @head.nil?
    current = @head
    if @head.next_node.nil?
      @head = nil
      return
    end
    current = current.next_node until current.next_node.nil?
    current.value = nil
  end

  def contains?(value)
    return false if @head.nil?
    current = @head

    until current.nil?
      return true if current.value == value
      current = current.next_node
    end
    
    false
  end

  def find(value)
    return nil if @head.nil?
    current = @head
    index = 0

   until current.nil?
     return index if current.value == value
     current = current.next_node
     index += 1
   end
   nil
  end

  def to_s
    return nil if @head.nil?
    current = @head
    string = ''
    until current.nil?
      string += "( #{current.value} ) ->"
      current = current.next_node
    end
    string += 'nil'
    string
  end

  def insert_at(value,index)
    return nil if @head.nil?
    return prepend(value) if index.zero?
    return append(value) if index == size

    current = @head
    count = 0

    until count == index - 1
      current = current.next_node
      count += 1
    end
    current.next_node = Node.new(value,current.next_node)
  end

  def remove_at(index)
    return nil if @head.nil?
    return @head = @head.next_node if index.zero?

    current = @head
    count = 0

    until count == index - 1
      current = current.next_node
      count += 1
    end
    current.next_node = current.next_node.next_node

  end
end