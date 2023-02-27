class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      #check if cache size is <= size
      #if so, then add need to remove first ele, and add new ele to the back
      @cache.delete_if {|cache_item| cache_item == el}
      self.push(el)

      if self.count > self.size
        self.shift
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @cache
    end

    private
    # helper methods go here!
    attr_reader :size

    def shift
        @cache.shift
    end

    def push(el)
        @cache.push(el)
    end


  end


  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show 