require 'linked_list_item'

class LinkedList
  include Comparable

  attr_accessor :size
  attr_accessor :first_item

  # called by LinkedList.new
  def initialize *args
    @size = 0
    args.each do |arg|
      add_item(arg)
    end
  end

  def add_item(payload)
    @size += 1
    if @first_item.nil?
      @first_item = LinkedListItem.new(payload)
    else
      item = @first_item
    until item.next_list_item.nil?
      item = item.next_list_item
    end
    item.next_list_item = LinkedListItem.new(payload)
    end
  end

  def get(n)
    raise IndexError, "No items at negative index" if n < 0
    i = 0
    item = @first_item
    while i < n
      if item.nil?
        raise IndexError, "No items at that index number"
      end
      item = item.next_list_item
      i += 1
    end
    item.payload
  end

  def last
    if size == 0
      return nil
    end
  end

end
