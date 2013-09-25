#encoding: utf-8
#*********pdf generation************
class ReportPdf < Prawn::Document
 
  def initialize(report, view)
    super(top_margin: 70)
    @reports = report
    @view = view
    font "Helvetica"  
    stroke_color '000088'
    headding
    index
    start_new_page 
    show_report
    page_count.times do |i|
    go_to_page(i+1)
    bounding_box([bounds.right-50, bounds.bottom + 12], :width => 50) {
      text "Page #{i+1}"
    }
  end #end of page
   
  end #end of initialize
	def headding
		stroke do
		  # just lower the current y position
		  move_down 255
		  horizontal_rule
		  move_down 25
		
		  text "BI INDEX REPORT", size: 25, style: :bold, align: :center, font: "Helvetica"
		  move_down 25
		  horizontal_rule
		  move_down 40
		end
		 text "<b>Report Date</b>",size: 11 ,:align => :right, inline_format: true
		 text "<b>#{Date.today.strftime('%m/%d/%y')}</b>",size: 11 ,:align => :right, inline_format: true
#		 move_down 20
#		 text "<b>BI Report</b>",size: 11 ,:align => :right, inline_format: true
		 start_new_page
   	end # end of headding
  
  def index
  		move_down 30

  		text "<b>Index</b>",size: 25 ,:align => :center, inline_format: true
  		move_down 20
  		no=1.to_i
  		@reports.each do |rep|  
  		
  			text "#{no}) #{rep.report_name}", size: 15, :align => :left
  			no+=1
  		end
  		
  end  #end of index
  def show_report
   @reports.each do |rep|   
 	

	text "#{rep.report_name} ",:align => :center , size: 25, font: "Helvetica"
#  		start_new_page

	move_down 100
	text "Image :"   ,:style => :bold
	move_down 50
	 if !rep.report_attachments.blank?

                  path = get_image_path(rep.report_attachments[0].image_attachment_url)
                  image path , :width => 200, :height => 200
                  else
                  path ="#{Rails.root}/app/assets/images/reports.png"
                  image path, :width => 200, :height => 200
	 end
	move_down 100
	text "Description :",:style => :bold
	move_down 20
data=Array.new
		data << ["Report Id", "Report Name",  "Category","Department", "System","Owner","module","frequency","status","usage"]
		data << [rep.reportid,rep.report_name,rep.category,rep.department,rep.system,rep.owner,rep.module,rep.frequency,rep.status,rep.usage]
		
		
	    table data do
		  row(0).font_style = :bold
		  row(0).align = :center
		  columns(1..10).width=55
		  #columns(1..3).height=150
		  self.row_colors = ["DDDDDD", "FFFFFF"]
		  self.header = true 
		end
		
#	 if !rep.report_notes.blank?
#         
#                 text "#{rep.report_notes[0].notes}"
#                  
#	 end  
  
  end
  end #end of show_report
  
  def get_image_path(name)
         
         return "#{Rails.root}/public#{name}"
	   
  end #emd of get_image_path


end # end of class
