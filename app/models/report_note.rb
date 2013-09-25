class ReportNote < ActiveRecord::Base
  attr_accessible :notes, :report_id
  belongs_to :report
end
