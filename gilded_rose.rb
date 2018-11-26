class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality( qualityUpdater = 1)
    @items.each do |item|
      case item.name
        when 'Sulfuras, Hand of Ragnaros' 
          qualityUpdater = 0
        when 'Aged Brie'
          qualityUpdater = -1
        when 'Backstage passes to a TAFKAL80ETC concert'
          qualityUpdater = concertQualityUpdater(item)
      end
      item.sell_in = item.sell_in - 1
      item.quality = item.quality - qualityUpdater
    end
  end

  def concertQualityUpdater(item)
    item.sell_in < 11 ? (item.sell_in < 6 ? -3 : -2) : -1
  end
end

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
