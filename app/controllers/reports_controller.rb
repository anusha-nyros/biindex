class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index
  
    
  #  @reports = Report.all
  
             if params[:list_v]
		@listv = true
	    end

@q = current_user.organization.reports.search(params[:q])
@reports=@q.result.page(params[:page]).per(25)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])
    @options=params[:opts]
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOo"
    puts @options.class
    puts @options.inspect
    puts params[:name]
    puts params[:options]
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOo"    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end
 
  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new
    @report_notes = @report.report_notes
    @report_attachments = @report.report_attachments
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end 
  end 
  
  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  
  def create
    @r=current_user.organization.reports(:order=>'created_at ASC').last
#    puts @r.inspect
#    puts @r.id+1
    
    @report = Report.new(params[:report])
    if @r
    	@report.reportid=@r.id+1
    else
    	@report.reportid=1
    end
    @report.user=current_user
    @report.organization=current_user.organization 
    @report.last_updated = change_date_format(params[:report][:last_updated]) if !(params[:report][:last_updated]).blank?
    
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update   
    @report = Report.find(params[:id]) 
      puts "PPPPPPPPPPPPPPPPPPPPpp"
  puts params[:report].inspect
  puts params[:report].class
  puts "PPPPPPPPPPPPPPPPPPPPPPPPP"

params[:report][:last_updated]=change_date_format(params[:report][:last_updated]) if !(params[:report][:last_updated]).blank?

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy 
 
    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end  

def search 
     
 	params[:q][:last_updated] = change_date_format(params[:q][:last_updated]) if !(params[:q][:last_updated]).blank?   
@q = current_user.organization.reports.search(params[:q])
@reports = @q.result.page(params[:page]).per(25)

end

def export_to_pdf

	@reports = Array.new
	params[:report_check].split(",").map do |id|
   		
   		@reports << Report.find_by_id(id)
   		
   	end  

pdf = ReportPdf.new(@reports,view_context)
         send_data pdf.render, filename: "pdf_report.pdf",type: "application/pdf",disposition: "attachment"

end #generates pdf 

	def listview_report 
	
	@svals=params[:options]
	if params[:id]==="all"
		
		@report=current_user.organization.reports
		
	else
			
		@report = Report.find(params[:id]);
	end
		render :partial => 'listview_report'
		
	
	end #shows all reports from reports model



end
