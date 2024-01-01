class UploadedFile < ApplicationRecord
  validates :name, presence: true
  mount_uploader :attachment, AttachmentUploader
end
