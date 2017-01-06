class AddAttachmentImageToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :ideas, :image
  end
end
