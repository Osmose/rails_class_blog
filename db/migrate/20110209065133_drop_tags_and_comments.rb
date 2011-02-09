class DropTagsAndComments < ActiveRecord::Migration
  def self.up
    drop_table :tags
    drop_table :comments
  end

  def self.down
    create_table "comments" do |t|
        t.string   "commenter"
        t.text     "body"
        t.integer  "post_id"
        t.datetime "created_at"
        t.datetime "updated_at"
    end

    create_table "tags" do |t|
        t.string   "name"
        t.integer  "post_id"
        t.datetime "created_at"
        t.datetime "updated_at"
    end
  end
end
