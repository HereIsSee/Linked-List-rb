require_relative 'node.rb'

class LinkedList
  attr_accessor :head, :tail

  def initialize(head = nil, tail = nil, pointer = head)
    @head = head
    @tail = tail
    @pointer = pointer
  end

  def append value
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
end


list = LinkedList.new
[0,2,3,1,4,6,66].each {|value| list.append(value)}
list.read_data