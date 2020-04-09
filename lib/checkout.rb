class Checkout

    attr_accessor :total,:promotions,:scanned,:items_in_store

    def initialize(attr={})
        @total=0
        @promotions=attr[:promos]
        @scanned = []
        @items_in_store=[
            {product_code:"001",name:"Tie",price:9.25},
            {product_code:"002",name:"Sweater",price:45.00},
            {product_code:"003",name:"Skirt",price:19.95}
        ]   
    end


    def scan(item)
        @items_in_store.each do |i|
         if i[:product_code] == item
         @scanned << i
         end
        end
    end

    def scan_reset
        @scanned = []
    end


    def total
        total=0
        if @promotions[:promo1] == false && @promotions[:promo2] == false
         @scanned.each do |i|
            total+=i[:price]
         end
         p total
        elsif @promotions[:promo1] == true && @promotions[:promo2] == false
          @scanned.forEach do
         end
        elsif @promotions[:promo1] == false && @promotions[:promo2] == true
          @scanned.forEach do     
          end
        else 
          @scanned.forEach do 
          end
        end
    end


end