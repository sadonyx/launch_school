class SimpleLinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end

  def peek
    head ? head.datum : head
  end

  def size
    count = 0
    node = self.head
    return count if head == nil
    until node == nil
      count += 1
      node = node.next
    end
    return count
  end

  def empty?
    size == 0
  end

  def push(datum)
    old_head = self.head
    self.head = Element.new(datum, old_head)
  end

  def pop
    old_head = self.head
    self.head = head.next
    old_head.datum
  end

  def to_a
    arr = []
    current_node = head
    size.times do
      break if current_node.datum == nil
      arr.push current_node.datum
      current_node = current_node.next
    end
    arr
  end

  def reverse
    list = SimpleLinkedList.new
    current_node = head
    until current_node.nil? do
      list.push(current_node.datum)
      current_node = current_node.next
    end
    list
  end

  def self.from_a(arr)
    list = new()
    arr ? arr.reverse.each { |datum| list.push(datum) } : list
    list
  end

  private
  attr_writer :head
end

class Element
  attr_reader :datum
  
  def initialize(datum, pointer=nil)
    @datum = datum
    @pointer = pointer
  end

  def next
    pointer
  end

  def tail?
    pointer == nil
  end

  private
  attr_reader :pointer
end

=begin
  def reverse
    current_node = head
    new_head = nil
    (size - 1).times do |i|
      loop do
        puts current_node.datum
        if current_node.next.tail?
          new_head = current_node.next if i == 0
          current_node.next.set_pointer = current_node
          current_node.set_pointer = nil
          break
        else
          current_node = current_node.next
        end
      end
      current_node = head
    end
    self.head = new_head
    self
  end

  def set_pointer=(element)
    @pointer = element
  end
=end