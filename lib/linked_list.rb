require 'linked_list_item'

class LinkedList
  attr_reader :size

  def initialize *payloads
    @size = 0
    payloads.each do |payload|
      add_item(payload)
    end
  end

  def add_item(payload)
    lli = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = lli
    else
      item = @first_item
      until item.last?
        item = item.next_list_item
      end
      item.next_list_item = lli
    end
    @size += 1
  end

  # For Accessing Payloads
  def get(n)
    raise IndexError if n < 0 or n >= size
    item = @first_item
    n.times do
      item = item.next_list_item
    end
    item.payload
  end

  alias_method :[], :get

  # For Accessing Items
  def get_item(n)
    raise IndexError if n < 0 or n >= size
    item = @first_item
    n.times do
      item = item.next_list_item
    end
    item
  end

  def last
    if size == 0
      nil
    else
      get(size - 1)
    end
  end

  def to_s
    if size == 0
      "| |"
    else
      result = "|"
      item = @first_item
      until item.nil?
        result << " " + item.payload
        result << "," unless item.last?
        item = item.next_list_item
      end
      result + " |"
    end
  end

  def []=(n, payload)
    item = @first_item
    n.times do
      item = item.next_list_item
    end
    item.payload = payload
  end

  def remove(n)
    raise IndexError if n < 0 or n >= size
    if n === 0
      @first_item = @first_item.next_list_item
    else
      previous_item = get_item(n-1)
      node_item = get_item(n)
      previous_item.next_list_item = node_item.next_list_item
    end
    @size -= 1
  end

  def indexOf(arg)
    n = 0
    item = @first_item
    while n <= size
      if item.nil?
        break
      elsif item.payload == arg
        return n
      end
      item = item.next_list_item
      n += 1
    end
  end

  def sorted?
    item = @first_item
    if @size == 0 || @size == 1
      return true
    end
    until item.last?
      if item <= item.next_list_item
        result = true
      else
        result = false
      end
      item = item.next_list_item
    end
    return result
  end

  def sort
    if @size == 0
      return LinkedList.new
    end
    if @size == 1
      return LinkedList.new(@first_item.payload)
    end
    ll = LinkedList.new
    item = @first_item
    until item.last?
      if item <= item.next_list_item
        ll.add_item(item.payload)
        ll.add_item(item.next_list_item.payload)
      else
        ll.add_item(item.next_list_item.payload)
        ll.add_item(item.payload)
      end
      item = item.next_list_item
    end
    ll
  end

end
