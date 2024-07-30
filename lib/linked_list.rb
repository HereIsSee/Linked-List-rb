require_relative 'node.rb'

class LinkedList
  attr_accessor :head, :tail

  def initialize(head = nil, tail = nil, pointer = head)
    @head = head
    @tail = tail
    @pointer = pointer
    @size = 0
  end

  def prepend value
    @size += 1
    @head = Node.new(value, @head)
  end

  def append value
    @size += 1
    if @head.nil?
      @head = Node.new(value, nil)
      @tail = @head
      return
    end
    @tail.next_node = Node.new(value, nil)
    @tail = @tail.next_node
    @head.data
  end

  def read_data
    @pointer = @head
    until @pointer.nil? do 
      puts @pointer.data 
      @pointer = @pointer.next_node
    end
  end

  def size
    @size
  end

  def at index
    @pointer = @head

    index.times do 
      @pointer = @pointer.next_node
    end
    @pointer
  end

  def pop
    @pointer = @head

    (@size-2).times do 
      @pointer = @pointer.next_node
    end
    @size -= 1
    @pointer.next_node = nil
  end

  def contains? value
    @pointer = @head
    until @pointer.nil? do 
      return true if @pointer.data == value
      @pointer = @pointer.next_node
    end
    false
  end

  def find value
    index = 0
    @pointer = @head
    until @pointer.nil? do 
      return index if @pointer.data == value
      @pointer = @pointer.next_node
      index += 1
    end
    nil
  end

  def insert_at value, index
    if index == 0 
      @head = Node.new(value,@head)
      return
    end
    return puts "index out of bounds" if index >= @size
    @pointer = @head
    temp = nil
    index.times do |indicator|
      temp = @pointer if (index-1) == indicator 
      @pointer = @pointer.next_node
    end
    temp.next_node = Node.new(value, @pointer)
    return
  end

  def remove_at index
    if index == 0 
      @head = @head.next_node
      return
    end
    return puts "index out of bounds" if index >= @size
    @pointer = @head
    temp = nil
    index.times do |indicator|
      temp = @pointer if (index-1) == indicator 
      @pointer = @pointer.next_node
    end
    temp.next_node = @pointer.next_node
    return
  end

  def to_s
    string = ""
    @pointer = @head
    until @pointer.nil? do 
      string += "( #{@pointer.data} ) -> "
      @pointer = @pointer.next_node
    end
    string+= "nil"
  end
end


list = LinkedList.new
[0,2,3,1,4,6,66].each {|value| list.append(value)}

p list.to_s
list.remove_at(6)
p list.to_s
list.remove_at(0)
p list.to_s
# list.read_data
# puts
# list.pop
# puts
# list.read_data