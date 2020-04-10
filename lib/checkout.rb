class Checkout

    attr_accessor :bill,:promotions,:scanned,:items_in_store

    def initialize(attr={})
        @bill=0
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
        @subbill=0
        @subbill1=0
        if @promotions[:promo1] == false && @promotions[:promo2] == false
            subtot()
        elsif @promotions[:promo1] == true && @promotions[:promo2] == false
            subtot()
            @subbill > 60 ? @bill=(@subbill*0.9).round(2) : @bill=@subbill.round(2)
        elsif @promotions[:promo1] == false && @promotions[:promo2] == true  
            subtot()
            number_ties = @scanned.count(@items_in_store[0])
            number_ties > 1 ? @bill=(@subbill-0.75*number_ties).round(2) : @bill=@subbill.round(2)
        else 
            subtot()
            number_ties = @scanned.count(@items_in_store[0])
            number_ties > 1 ? subbill2=@subbill1-0.75*number_ties : subbill2=@subbill1
            subbill2 > 60 ? @bill=(subbill2*0.9).round(2) : @bill=subbill2.round(2)
        end
    end

    private

    def subtot()
        @scanned.each do |i|
            @bill+=i[:price]
        end
        @subbill=@bill
        @subbill1=@bill
    end


end