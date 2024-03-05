require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do


  context "Aged Brie" do
    it "is good for sale" do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..1).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Aged Brie")
      expect(result.first.sell_in).to be >= 0
    end

    it "expired" do
      items = [Item.new(name="Aged Brie", sell_in=2, quality=0)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..4).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Aged Brie")
      expect(result.first.sell_in).to be < 0
      expect(result.first.quality).to be >= 4
    end
  end

  context "Backstage passes to a TAFKAL80ETC concert" do
    it "is good for sale" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..1).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Backstage passes to a TAFKAL80ETC concert",)
      expect(result.first.sell_in).to be >= 0
    end

    it "expired" do
      items = [Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..6).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Backstage passes to a TAFKAL80ETC concert")
      expect(result.first.sell_in).to be < 0
      expect(result.first.quality).to be >= 0
    end
  end

  context "Sulfuras, Hand of Ragnaros" do
    it "should sell" do
      items = [Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..4).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Sulfuras, Hand of Ragnaros")
      expect(result.first.quality).to be >= 80
    end
  end

  context "Conjured Mana Cake" do

    it "expired" do
      items = [Item.new(name="Conjured Mana Cake", sell_in=2, quality=0)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..4).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Conjured Mana Cake")
      expect(result.first.sell_in).to be < 0
      expect(result.first.quality).to be 80
    end

    it "should sell" do
      items = [Item.new(name="Conjured Mana Cake", sell_in=3, quality=6)]
      gilded_rose = GildedRose.new items
      result = nil
      (0..2).each do |item|
        result = gilded_rose.update_quality()
      end
      expect(result.first.name).to eq("Conjured Mana Cake")
      expect(result.first.sell_in).to be >= 0
      expect(result.first.quality).to be 80
    end
  end
end
