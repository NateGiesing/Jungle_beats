require "./lib/node.rb"
class LinkedList
  attr_reader :head

  def initialize
    @head  = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
     else
       current_node = @head
       until current_node.next_node == nil
         current_node = current_node.next_node
       end
       current_node.next_node = Node.new(data)
        # require "pry"; binding.pry
    end
    data
  end

  def prepend(data)
    old_nodes = @head
    @head = Node.new(data)
    @head.next_node = old_nodes
    data
  end

 def insert(position, data)
  current_node = @head
  counter = 1
  while counter != position
    current_node = current_node.next_node
    counter += 1
  end

  new_node = Node.new(data)
  remaining_nodes = current_node.next_node
  current_node.next_node = new_node
  new_node.next_node = remaining_nodes
  end

  def count
      current_node = @head
      if head.nil?
        counter = 0
      else
        counter = 1
        until current_node.next_node == nil
          current_node = current_node.next_node
          counter += 1
        end
      end
      counter
  end

  def to_string
    current_node   = @head
    bag_of_strings = []
    bag_of_strings << @head.data
    until current_node.next_node.nil?
      current_node = current_node.next_node
      bag_of_strings << current_node.data
    end
    bag_of_strings.join(" ")
  end

  def find(position, return_amount)
    current_node = @head
    counter = 0
    sounds = ""
    until position == counter
      current_node = current_node.next_node
      counter += 1
    end

    return_amount.times do
      sounds << current_node.data + " "
      counter += 1
      current_node = current_node.next_node
    end
  sounds.chop
  end

  def includes?(data)
  current_node = @head
  until current_node.next_node == nil
    if current_node.data == data
      return true
    end
    current_node = current_node.next_node
  end

    if current_node.data != data
      return false
    end
  end

  def pop
    current_node = @head
    until current_node.next_node.next_node == nil
      current_node = current_node.next_node
    end
    node = current_node.next_node.data
    current_node.next_node = nil
    node
  end

end
