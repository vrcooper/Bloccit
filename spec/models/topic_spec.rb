require 'rails_helper'

describe Topic do 


  describe "scopes" do

    before do
      @public_topic = Topic.create(name: 'Public topic name',
      description: 'The topic description must be fairly long') # default is public
      
      @private_topic = Topic.create(name: 'Private Topic name', description: 'This 
        topic description must also be fairly long', public: false)
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect(Topic.publicly_viewable).to eq( [@public_topic] )
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
        expect(Topic.privately_viewable).to eq( [@private_topic] )# Your code here
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = User.new
        expect(Topic.visible_to(user)).to eq(Topic.all )# Your code here
      end
    end

      it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.visible_to(user)).to eq(Topic.publicly_viewable)# Your code here
      end
    end
  end
  


  
