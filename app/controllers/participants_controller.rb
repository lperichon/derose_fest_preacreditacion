class ParticipantsController < ApplicationController

  load_and_authorize_resource

  skip_authorize_resource :only => [:new, :create]

  skip_before_filter :authenticate_user!, :only => [:new, :create]
  skip_before_filter :require_padma_account, :only => [:new, :create]
  skip_before_filter :set_current_account, :only => [:new, :create]
  skip_before_filter :set_timezone, :only => [:new, :create]
  skip_before_filter :set_locale, :only => [:new, :create]

  respond_to :html

  def index
    @query = params[:q]

    @participants = @participants.query(@query).all
    
    respond_with @participants
  end

  def new
    @accounts = PadmaAccount.all
    render layout: "layout_for_new_only"
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to new_participant_url, notice: "Pre-acreditación exitosa!"
    else
      @accounts = PadmaAccount.all
      flash[:alert] = "Error en el formulario"

      render action: :new, layout: "layout_for_new_only"
    end
  end

  def destroy
    @participant.destroy
    redirect_to participants_path, notice: "Succes!"
  end

  private

  def participant_params
    params.require(:participant).permit(
        :first_name,
        :last_name,
        :identification,
        :email,
        :local_account_id,
        :account_name
    )
  end

end
