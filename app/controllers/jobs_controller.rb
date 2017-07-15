class JobsController < ApplicationController
  def index
    if params.include?("sort")
      @company = Company.find(params[:company_id])
      @job = Job.all
      @jobz = @job.where(city: params[:sort])
      @jobs = Job.find_by(params[:city],[:sort])

      render :location
    else
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
      @contact = Contact.new
      @contacts = Contact.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
    if @job.update_attributes(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path
  end

  private

  def set_jobs
    @job = Job.find(params[:id])
    @company = Company.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
