class ReportAttachment < ActiveRecord::Base
  attr_accessible :image_attachment, :report_id
  belongs_to :report
  mount_uploader :image_attachment, ImageAttachmentUploader
end
