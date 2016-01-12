shared_examples "country code normalization" do

    context "is missing" do
      before { subject.country = "Germany" }
      it     { is_expected.not_to be_valid }
    end

    context "is carried out" do
      before { subject.country = "DE"  }
      it     { is_expected.to be_valid }
    end

end


