class JobListingsController < ApplicationController

  def index
    @job_listings = JobListing.all
  end

  def show
    @job_listing = job_listing
  end

  def new
    @job_listing = JobListing.new
  end

  def create
    @job_listing =
    current_user.job_listings.build(job_listing_params)
    if @job_listing.save
      redirect_to job_listings_path
    else
      render :new
    end
  end

  private

  def job_listing_params
    params.require(:job_listing).permit(:position, :salary, :description)
  end

  def job_listing
    JobListing.find(params[:id])
  end

end
