require "./lib/checkout.rb"

describe Checkout do

    subject {Checkout.new({promos:{promo1:true,promo2:true}})}

    let(:items) { [{product_code:"001",name:"Tie",price:9.25},
        {product_code:"002",name:"Sweater",price:45.00},
        {product_code:"003",name:"Skirt",price:19.95}]
    }

    it "Scans item" do
        subject.scan(items[0][:product_code])
        expect(subject.scanned).not_to be_empty
    end

    it "Reset scanned items" do
        subject.scan(items[0][:product_code])
        subject.scan_reset
        expect(subject.scanned).to be_empty   
    end

    it "Calculate cart consist of 001,002,003" do
        subject.scan(items[0][:product_code])
        subject.scan(items[1][:product_code])
        subject.scan(items[2][:product_code])
        expect(subject.total).to eq 66.78
    end

    it "Calculate cart consist of 001,003,001" do
        subject.scan(items[0][:product_code])
        subject.scan(items[2][:product_code])
        subject.scan(items[0][:product_code])
        expect(subject.total).to eq 36.95
    end

    it "Calculate cart consist of 001,002,001,003" do
        subject.scan(items[0][:product_code])
        subject.scan(items[1][:product_code])
        subject.scan(items[0][:product_code])
        subject.scan(items[2][:product_code])
        expect(subject.total).to eq 73.76
    end



    
end