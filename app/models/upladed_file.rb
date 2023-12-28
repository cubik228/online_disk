class UpladedFile < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
end
