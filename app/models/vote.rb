class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }

  after_save :update_post

  after_create :create_vote

  private

    def update_post
      post.update_rank
    end

    def create_vote
      user.votes.create(post: self, value: 1)
    end
end
