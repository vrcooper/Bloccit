class AddSummaryToPosts < ActiveRecord::Migration
  def change
    # switch this...add a post_id to summaries
    # rake db:rollback
    # rake db:migrate
    # rake db:seed

    add_column :posts,:summary_id, :integer
    add_index :posts, :summary_id
  end
end
