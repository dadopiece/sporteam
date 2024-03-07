class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participation, only: [:destroy]


  def new
    @event = Event.find(params[:id])
    @participation = Participation.new
  end

  def instant_create
    @event = Event.find(params[:id])
    if @event.participations.count < @event.max_player
      @participation = Participation.new(event: @event, user: current_user)
      if @participation.save
        redirect_to @event, notice: 'Participation confirmée.'
      else
        redirect_to @event, alert: 'Vous êtes déjà inscrit à cet évènement.'
      end
    else
      redirect_to @event, alert: 'Cet événement a déjà atteint le nombre maximum de participants.'
    end
  end

  def destroy
    @participation.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_participation
    @participation = Participation.find(params[:id])
  end
end
