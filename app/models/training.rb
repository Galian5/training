class Training < ApplicationRecord
  has_many :exercises, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
  validates :image, file_size: { less_than: 1.megabytes }
  accepts_nested_attributes_for :exercises, allow_destroy: true,
                                reject_if: ->(attrs) { attrs['name'].blank? || attrs['series'].blank? || attrs['repetitions'].blank? }
end
