require "./lib/checkout.rb"

describe Checkout do
   describe "Check with both promos" do
        subject(:co1) {Checkout.new({promos:{promo1:true,promo2:true}})}
        subject(:co2) {Checkout.new({promos:{promo1:true,promo2:false}})}
        subject(:co3) {Checkout.new({promos:{promo1:false,promo2:true}})}
        subject(:co4) {Checkout.new({promos:{promo1:false,promo2:false}})}

        let(:items) { [{product_code:"001",name:"Tie",price:9.25},
            {product_code:"002",name:"Sweater",price:45.00},
            {product_code:"003",name:"Skirt",price:19.95}]
        }

        it "Scans item" do
            co1.scan(items[0][:product_code])
            expect(co1.scanned).not_to be_empty
        end

        it "Reset scanned items" do
            co1.scan(items[0][:product_code])
            co1.scan_reset
            expect(co1.scanned).to be_empty   
        end

        it "Calculate cart consists of 001,002,003 with PROMO1 and PROMO2" do
            [0,1,2].each {|i| co1.scan(items[i][:product_code]) }
            expect(co1.total).to eq 66.78
        end

        it "Calculate cart consists of 001,003,001 with PROMO1 and PROMO2" do
            [0,2,0].each {|i| co1.scan(items[i][:product_code]) }
            expect(co1.total).to eq 36.95
        end

        it "Calculate cart consists of 001,002,001,003 with PROMO1 and PROMO2" do
            [0,1,0,2].each {|i| co1.scan(items[i][:product_code])}
            expect(co1.total).to eq 73.76
        end

        it "Calculate cart consists of 001,002,001,003 with only PROMO1" do
            [0,1,0,2].each {|i| co2.scan(items[i][:product_code])}
            expect(co2.total).to eq 75.11
        end

        it "Calculate cart consists of 001,002,001,003 with only PROMO2" do
            [0,1,0,2].each {|i| co3.scan(items[i][:product_code])}
            expect(co3.total).to eq 81.95
        end

        it "Calculate cart consists of 001,002,001,003 with no promotion" do
            [0,1,0,2].each {|i| co4.scan(items[i][:product_code])}
            expect(co4.total).to eq 83.45
        end

    end




        


    
end