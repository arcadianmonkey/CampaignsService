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
    campaign = Campaign.build(campaign_params)
    if campaign.save!
      show
    else
      redirect_to :error
    end
  end

  private

  def campaign_params
    params.require(:name)
    params.require(:email)
    params.require(:date)
    params.require(:assets)
    params["assets"].each do |asset|
      asset.require(:name)
      asset.require(:criteria)
      asset["criteria"].each do |criterion|
        criterion.require(:type)
        criterion.permit(:operand, :image, :order, :criteria)
      end
    end

    params
  end
end
