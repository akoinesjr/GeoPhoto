class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  private

    def max_image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
