class UploadedFile < ApplicationRecord
  
  mount_uploader :attachment, AttachmentUploader
end
