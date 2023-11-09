Criterion.destroy_all
Asset.destroy_all
Campaign.destroy_all

Campaign.create!(
    name: "Sample Campaign",
    email: "pharris2697@gmail.com",
    date: Date.new(2023, 11, 1)
)

campaign = Campaign.where(name: "Sample Campaign").first
campaign.assets.create!(
    name: "Asset 1"
)

asset = campaign.assets.first
asset.criterions.create!([
    {
        criterion_type: "device",
        operand: "iphone",
        image: "placeholder.gif",
        order: 1
    },
    {
        criterion_type: "device",
        operand: "android",
        image: "placeholder.gif",
        order: 2
    },
    {
        criterion_type: "nested",
        image: "placeholder.gif",
        order: 3
    },
    {
        criterion_type: "always",
        image: "placeholder.gif",
        order: 1000
    }
])

nesting_parent = asset.criterions.where(criterion_type: "nested").first
nesting_parent.criterions.create!([
    {
        criterion_type: "device",
        operand: "windows_phone"
    },
    {
        criterion_type: "device",
        operand: "palm_pilot"
    }
])
