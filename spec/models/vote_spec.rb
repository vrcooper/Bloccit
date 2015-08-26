#require 'rails_helper'

#RSpec.describe Vote, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
#end
require 'rails_helper'

describe Vote  do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        #expect(vote.value).to eq(-1 || 1)

        up_vote = Vote.new(value: 1)
        down_vote = Vote.new(value: -1)
        nil_vote = Vote.new(value: 0)

        expect(up_vote.valid?).to eq(true)
        expect(down_vote.valid?).to eq(true)
        expect(nil_vote.valid?).to eq(false)
      end
    end 
  end  
end