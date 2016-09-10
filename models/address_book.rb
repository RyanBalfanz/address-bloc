require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    # #9
    index = 0
    entries.each do |entry|
    # #10
      if name < entry.name
        break
      end
      index += 1
    end
    # #11
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    matchedIndex = nil
    entries.each_with_index do |entry, index|
      if entry.name == name && entry.phone_number == phone_number && entry.email == email
        matchedIndex = index
        break
      end
    end
    if matchedIndex != nil
      entries.delete_at(matchedIndex)
    else
      # Not found
    end
  end
end
