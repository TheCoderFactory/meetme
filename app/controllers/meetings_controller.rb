class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:like, :unlike, :uninvite_to, :invite_to, :show, :edit, :update, :destroy]

  def like
    @meeting.liked_by current_user
    redirect_to :back
  end

  def unlike
    @meeting.unliked_by current_user
    redirect_to :back
  end

  def uninvite_to
    @user = User.find(params[:user_id])
    @meeting.users.delete(@user)
    redirect_to :back
  end

  def invite_to
    @user = User.find(params[:user_id])
    @meeting.users << @user
    InviteEmailJob.perform_async(@user.id, @meeting.id)
    redirect_to :back
  end


  # GET /meetings
  # GET /meetings.json
  def index
    if params[:tag]
      @meetings = Meeting.tagged_with(params[:tag])
    else
      @meetings = Meeting.all
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @tags = @meeting.tags
    @users = User.all
    @organiser = User.find(@meeting.organiser_id)
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.organiser_id = current_user.id

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :reason, :street, :suburb, :postcode, :state, :date, :start_time, :end_time, :organiser_id, :tag_list)
    end
end
