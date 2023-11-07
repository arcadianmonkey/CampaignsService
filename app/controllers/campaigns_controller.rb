class CampaignsController < ApplicationController
  def show
    @campaigns =
      if params[:id]
        Campaign.where(id: params[:id])
      else
        Campaign.all
      end
  end

  def create
    campaign = Campaign.new(campaign_params)
    if campaign.save
      redirect_to campaign
    else
      redirect_to :error
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :email, :date)
  end
end
