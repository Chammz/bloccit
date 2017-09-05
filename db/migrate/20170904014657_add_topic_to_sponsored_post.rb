class AddTopicToSponsoredPost < ActiveRecord::Migration[5.1]
  def change
    add_column :sponsoredpost, :topic_id, :integer
    add_index :sponsoredpost, :topic_id
  end
end
