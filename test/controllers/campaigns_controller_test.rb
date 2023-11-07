require "test_helper"

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  test "show all campaigns" do
    get campaigns_show_url
    assert_response :success
  end

  test "show single existing campaign" do
    campaign = campaigns(:one)
    get campaigns_show_url(campaign)
    assert_response :success
  end

  good_params = {
    name: "Campaign_3",
    email: "pharris2697@gmail.com",
    date: Date.current,
    assets: [{
      name: "Asset_3",
      criteria: [{
        type: "device",
        operand: "iphone",
        image: "placeholder.jpeg",
        order: 1
      },
      {
        type: "device",
        operand: "android",
        image: "placeholder.jpeg",
        order: 2
      }]
    },
    {
      name: "Asset_4",
      criteria: [{
        type: "device",
        operand: "windows_phone",
        image: "placeholder.jpeg",
        order: 3
      },
      {
        type: "device",
        operand: "palm_pilot",
        image: "placeholder.jpeg",
        order: 4
      }]
    }]
  }

  nested_criteria_params = {
    name: "Campaign_4",
    email: "pharris2697@gmail.com",
    date: Date.current,
    assets: [{
      name: "Asset_5",
      criteria: [{
        type: "nested",
        image: "placeholder.jpeg",
        order: 1,
        criteria: [{
          type: "device",
          operand: "windows_phone",
          image: "placeholder.jpeg",
          order: 3
        },
        {
          type: "device",
          operand: "palm_pilot",
          image: "placeholder.jpeg",
          order: 4
        }]
      }]
    }]
  }

  bad_params = {}

  test "create campaign with good params" do
    precount = Criterion.count
    post campaigns_create_url, params: good_params
    assert_response :success
    assert_equal(precount + 4, Criterion.count) # good_params should add 4 new Criterion records
  end

  test "create campaign with nested criteria params" do
    precount = Criterion.count
    post campaigns_create_url, params: nested_criteria_params
    assert_response :success
    assert_equal(precount + 3, Criterion.count) # nested_criteria_params should add 3 new Criterion records
  end

  test "create campaign with bad params" do
    precount = Criterion.count
    post campaigns_create_url, params: bad_params
    assert_response 400
    assert_equal(precount, Criterion.count) # No new records should be created
  end
end
