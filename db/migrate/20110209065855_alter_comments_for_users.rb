class AlterCommentsForUsers < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
        t.remove :name
        t.references :user
    end
  end

  def self.down
    change_table :posts do |t|
        t.string :name
        t.remove :user_id
    end
  end
end
