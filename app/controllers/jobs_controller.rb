class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.find_by(user_id: current_user[:id])
    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:name, :user_id, rre:{}
      ).merge(user_id: current_user.id)
    end
end



#rre: {"roles"=>[{"role_id"=>0, "role_name"=>"hole digger", "r
#esponsibities"=>[{"resp_id"=>0, "role_id"=>0, "expectations"=>[{"resp_id"=>0, "exp_id"=>0}],
# "resp_name"=>"WEKLJHeklj"}]}, {"role_id"=>1, "role_name"=>"TEST", "responsibities"=>[{"role
#_id"=>1, "resp_id"=>1, "resp_name"=>"TST R", "expectations"=>[]}]}]}

#rre: {"roles"=>[{"role_id"=>1, "role_percentage"=>"50%",
#{}"role_name"=>"catch dogs", "responsibilities"=>[{"resp_id"=>1, "resp_name"=>"woof", "expecta
#tions"=>[{"expectation_id"=>1, "expectation_name"=>"bark as much as possible"}, {"expectatio
#n_id"=>2, "expectation_name"=>"have the loudest bark at the dog park"}]}]}, {"role_id"=>2, "
#role_percentage"=>"50%", "role_name"=>"destroy yard", "responsibilities"=>[{"resp_id"=>2, "r
#esp_name"=>"dig fuck ton\n of holes", "expectations"=>[{"expectation_id"=>1, "expectation_na
#me"=>"dig at min 10 holes"}, {"expectation_id"=>2, "expectation_name"=>"diameter of 1ft"}]}]
#}]}
