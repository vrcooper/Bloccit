#require 'rails_helper'

#RSpec.describe Vote, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
#end
require 'rails_helper'



describe Vote  do

include TestFactories
  
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        #expect(vote.value).to eq(-1 || 1)

        up_vote = Vote.new(value: 1)
        expect(up_vote.valid?).to eq(true)
        
        down_vote = Vote.new(value: -1)
        expect(down_vote.valid?).to eq(true)

        nil_vote = Vote.new(value: 0)
        expect(nil_vote.valid?).to eq(false)
      end
    end 
  end  


describe 'after_save' do
  it "calls 'Post#update_rank' after save" do
  post = associated_post
  vote = Vote.new(value: 1, post: post)
  expect(post).to receive(:update_rank)
  vote.save
    end
  end
end


