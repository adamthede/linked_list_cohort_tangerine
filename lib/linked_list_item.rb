class LinkedListItem
  include Comparable

  attr_accessor :payload
  attr_accessor :next_list_item

  # called by LinkedListItem.new(payload)
  def initialize(payload)
    @payload = payload
    @next_list_item = nil
  end

  def next_list_item
    @next_list_item
  end

  def next_list_item=(linked_list_item)
    if linked_list_item === self
      raise ArgumentError, "Can't set next list item as self"
    end
    @next_list_item = linked_list_item
  end

  def === some_item
    self.object_id == some_item.object_id
  end

  def last?
    @next_list_item.nil?
  end

  def <=> (another)
    # self is the receiver
    # the receiver is compared against another
    # <=> returns -1, 0, 1 depending on whether self is less than, equal, or greater to another
    # Symbols > Strings
    # Strings > Integers

    if self.payload.class == another.payload.class
      return self.payload <=> another.payload
    end

    if self.payload.class == Symbol
      return 1
    elsif self.payload.class == String && another.payload.class == Symbol
      return -1
    elsif self.payload.class == String && another.payload.class == Fixnum
      return 1
    elsif self.payload.class == Fixnum
      return -1
    end
  end

end
