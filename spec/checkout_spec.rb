require "./lib/checkout.rb"

describe Checkout do

    let(:item) {{product_code:001,name:"Tie",price:9.25}}

    it "Scans item" do
        expect(subject.scan(item)).not_to be_empty
    end

    # it "Calculates a item without promo" do
        
    # end


    # it "Calculates 001,002,003 basket amount" do
        
    # end
    
end