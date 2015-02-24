require 'rails_helper'

describe Ability do
  
  subject(:ability) { Ability.new(user) }

  describe 'guest' do
    let(:user) { nil }

    it { should be_able_to :read, Good }
    it { should be_able_to :read, Category }
    it { should be_able_to :read, Article }
    it { should be_able_to :create, Order }
    it { should be_able_to :manage, Cart }
    it { should be_able_to :manage, CartItem }

    it { should_not be_able_to :manage, Good }
    it { should_not be_able_to :manage, Category }
    it { should_not be_able_to :manage, Order }

    it { should be_able_to :add_to_cart, Good }

    it { should be_able_to :create, User, admin: false }
    # it { should_not be_able_to :create, User, admin: true }

  end

  describe 'user' do
    let(:user) { create(:user) }

    it { should be_able_to :read, Good }
    it { should be_able_to :read, Category }
    it { should be_able_to :manage, CartItem }

    it { should be_able_to :create, Order }

    it { should_not be_able_to :manage, Good }
    it { should_not be_able_to :manage, Category }

  end

  describe 'admin' do
    let(:user) { create(:user, admin: true) }
    it { should be_able_to :manage, :all }
  end

end