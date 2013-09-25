class Report < ActiveRecord::Base
 attr_accessible :category, :department, :last_updated, :organization_id, :owner, :report_name, :system, :user_id,:module,:frequency,:status,:usage,:reportid
            
belongs_to :organization
belongs_to :user
has_many :report_notes,:dependent => :destroy
has_many :report_attachments,:dependent => :destroy
attr_accessible :report_notes_attributes, :report_attachments_attributes
accepts_nested_attributes_for :report_notes, :allow_destroy => true
accepts_nested_attributes_for :report_attachments, :allow_destroy => true
end
