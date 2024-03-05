MAX_QUALITY = 50

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

# General class
class General < Item
  def calc
    @sell_in -= 1
   return @quality = 0 if quality <= 0

    @quality -= 1
    @quality -= 1 if @sell_in.negative?
  end
end

# Aged Brie
class AgedBrie < Item
  def calc
    @sell_in -= 1
    return @quality == MAX_QUALITY

    @quality += 1
    @quality += 1 if item.quality <= 0
  end
end

# Backstage passes to a TAFKAL80ETC concert
class Backstage < Item
  def calc
    @sell_in -= 1
    
    return @quality = 0 if @sell_in.negative?

    @quality += 1
    @quality += 1 if @sell_in < 11
    @quality += 1 if @sell_in < 6
    @quality = MAX_QUALITY if @quality > MAX_QUALITY
  end
end


# Conjured Mana Cake class
class Conjured < Item
  def calc
    @sell_in -= 1
    return @quality = 0 if @quality <= 0
    @quality -= 2
  end
end

class Sulfuras < Item
  def calc;end
end

class GildedRose

  SPECIALIZED_CLASS = {
      'Aged Brie' => AgedBrie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
      'Conjured Mana Cake' => Conjured,
      'Sulfuras, Hand of Ragnaros' => Sulfuras
  }
  DEFAULT_CLASS = General
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each_with_index do |item, idx|
      instance = GildedRose.klass_for(item.name, item.sell_in, item.quality)
      instance.calc
      @items[idx] = instance
    end
    @items
  end

  def self.klass_for(name, sell_in, quality)
    (SPECIALIZED_CLASS[name] || DEFAULT_CLASS).new(name, sell_in, quality)
  end
end
