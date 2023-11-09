class CampaignsController < ApplicationController
  # disabling CSRF; Ideally, I should have created the project with the --api option to avoid
  # including the CSRF middleware
  protect_from_forgery with: :null_session

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
      # stub
      redirect_to :error
    end
  end

  private

  def campaign_params
    params.require([:name, :email, :date, :assets])
    params["assets"].each do |asset|
      asset.require([:name, :criteria])
      asset["criteria"].each do |criterion|
        criterion.require(:type)
        criterion.permit(:operand, :image, :order, :criteria)
      end
    end

    params
  end
end
