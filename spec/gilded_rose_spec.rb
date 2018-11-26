require_relative '../gilded_rose'

describe GildedRose do

  # items = [
  #   Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  #   Item.new(name="Aged Brie", sell_in=2, quality=0),
  #   Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  #   Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  #   Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  #   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  #   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  #   Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  #   # This Conjured item does not work properly yet
  #   Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
  # ]


  describe "#update_quality" do
    it "reduces sellin date daily" do
      items = [Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(9)
    end
    it "reduces sellin date of aged brie by 1 daily" do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(1)
    end
    it "keeps sellin date of hand rag the same" do
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(0)
    end
    it "keeps sellin date of hand rag the same (-1)" do
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(-1)
    end
    it "reduces sellin date of backstage pass by 1 daily" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(14)
    end
    it "reduces conjured sellin date by 1 daily" do
      items = [Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(2)
    end
  end
end
