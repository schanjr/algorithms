module HashTableProbes
  FIXED_PROBE_FORMULAS = %w(linear quadratic double_hashing)

  def linear_probe(array, index, _key)
    # Returns next available index of empty or deleted node
    # Does not check for available index back to the beginning.
    size = array.size
    while index <= size
      node = array[index]
      return index if node.nil? || node.deleted?
      index += 1
    end
    # Reached the end of the probe. Must resize.
    return -1
  end

  def linear_find(key)
    i = index(key, self.size)
    node = @items[i]
    while i < self.size
      if !node.nil? && !node.deleted? && node.key == key
        return @items[i]
      end
      i += 1
      node = @items[i]
    end
    nil
  end

  def quadratic_probe(array, index, _key)
    size = array.size
    counter = 1
    formula = index + (counter ^ 2)
    while formula <= size
      node = array[formula]
      return index if node.nil? || node.deleted?
      counter += 1
      formula = index + (counter ^ 2)
    end
    # Reached the end of the probe. Must resize.
    return -1
  end

  def quadratic_find(key)
    i = index(key, size)
    counter = 1
    formula = i + (counter ^ 2)
    while formula < size
      node = @items[formula]
      if !node.nil? && !node.deleted? && node.key == key
        return @items[i]
      end
      counter += 1
      formula = i + (counter ^ 2)
    end
    nil
  end

  def double_hashing_probe(array, index, key)
    # Assuming variable index is an output of the hashed function already, denoted h1(x)
    # We compute h2(x) here and add them together to provide the next available index slot
    # (hash1(key) + i * hash2(key)) % TABLE_SIZE
    #     # https://www.geeksforgeeks.org/double-hashing/
    #     # Must never evaluate to zero
    # TODO - CS curriculums refer double hashing as "cuckoo hashing". This formula may not be correct.
    size = array.size
    counter = 1
    formula = (index + (counter * dh_h2(key))) % size
    while formula <= size
      node = array[formula]
      return formula if node.nil? || node.deleted?
      counter += 1
      formula = (index + (counter * dh_h2(key))) % size
    end

    return -1
  end

  def dh_h2(key)
    7 - (key.sum % 7)
  end

  def double_hashing_find(key)
    i = index(key, size)
    counter = 1
    formula = (i + (counter * dh_h2(key))) % size
    while formula < size
      node = @items[formula]
      if !node.nil? && !node.deleted? && node.key == key
        return node
      end
      counter += 1
      formula = (i + (counter * dh_h2(key))) % size
    end
    nil
  end
end
