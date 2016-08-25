require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  context 'Factoryのユーザー' do
    describe 'Factoryのユーザーがvalidであること' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end
  end

  context 'ユーザーの属性' do
    describe 'name' do
      it 'nameは短すぎること' do
        user.name = "geeb"
        expect(user).to be_invalid
      end
      it 'nameは長すぎること' do
        user.name = "1234567890123456789012345678901"
        expect(user).to be_invalid
      end
    end

    describe 'e-mail' do
      it '適切なメールでないこと' do
        user.email = "ThisIsNotARealEmail"
        expect(user).to be_invalid
      end
    end

  end # 'ユーザーの属性'の終わり

end
