class Campaign < ApplicationRecord
    has_many :assets

    def self.build(params)
        campaign = Campaign.create(
            name: params["name"],
            email: params["email"],
            date: params["date"]
        )

        params["assets"].each do |asset|
            newAssetRecord = campaign.assets.create(name: asset["name"])
            asset["criteria"].each do |criterion|
                criterion_type = criterion["type"]
                if criterion_type == "device"
                    newAssetRecord.criterions.create(
                        criterion_type: criterion_type,
                        operand: criterion["operand"],
                        image: criterion["image"],
                        order: criterion["order"]
                    )
                elsif criterion_type == "always"
                    newAssetRecord.criterions.create(
                        criterion_type: criterion_type,
                        image: criterion["image"],
                        order: criterion["order"]
                    )
                elsif criterion_type == "nested"
                    newCriterionRecord = newAssetRecord.criterions.create(
                        criterion_type: criterion_type,
                        image: criterion["image"],
                        order: criterion["order"]
                    )

                    criterion["criteria"].each do |child|
                        newCriterionRecord.criterions.create(
                            criterion_type: child["type"],
                            operand: child["operand"],
                            order: child["order"]
                        )
                    end
                end
            end
        end

        campaign
    end
end
