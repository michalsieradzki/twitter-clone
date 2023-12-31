require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets).dependent(:destroy) }
  it { should validate_uniqueness_of(:username).case_insensitive.allow_blank }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:liked_tweets).through(:likes).source(:tweet) }
  it { should have_many(:bookmarks).dependent(:destroy) }
  it { should have_many(:bookmarked_tweets).through(:bookmarks).source(:tweet) }
  it { should have_many(:retweets).dependent(:destroy) }
  it { should have_many(:retweeted_tweets).through(:retweets).source(:tweet) }

  describe "set_display_name" do
    context "when dispaly_name is set " do
      it "does not change the display_name" do
        user = build(:user, username: "testowy", display_name: "Test User")
        user.save
        expect(user.reload.display_name).to eq("Test User")
      end
    end 
    context "when display_name is not set" do
      it "humanizes the previously set username" do
        user = build(:user, username: 'testowy', display_name: nil)
        user.save
        expect(user.reload.display_name).to eq("Testowy")
      end
    end
  end
end
