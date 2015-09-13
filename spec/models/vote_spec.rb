require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @vote_up = Vote.create(value: 1)
      @vote_dn = Vote.create(value: -1)
      @vote_saywhat = Vote.create(value: 0)
    end
  describe "value validation" do
    it "only allows -1 or 1 as values" do
        expect(@vote_up.valid?).to eq(true)
        expect(@vote_dn.valid?).to eq(true)
        expect(@vote_saywhat.valid?).to eq(false)
      end
    end
  end
end