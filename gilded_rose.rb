class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality( sellinUpdater = 1, qualityUpdater = 1)
    @items.each do |item|
      case item.name
        when 'Sulfuras, Hand of Ragnaros'
          sellinUpdater = 0
          qualityUpdater = 0
        when 'Aged Brie'
          item.quality == 50 ? qualityUpdater = 0 : qualityUpdater = -1
        when 'Backstage passes to a TAFKAL80ETC concert'
          qualityUpdater = item.sell_in < 11 ? (item.sell_in < 6 ? -3 : -2) : -1
        when 'Conjured Mana Cake'
          qualityUpdater = 2
      end
      item.sell_in = item.sell_in - sellinUpdater
      item.quality = item.quality - qualityUpdater
    end
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
