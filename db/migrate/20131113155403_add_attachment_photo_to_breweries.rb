class AddAttachmentPhotoToBreweries < ActiveRecord::Migration
  def self.up
    change_table :breweries do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :breweries, :photo
  end
end
