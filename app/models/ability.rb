class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user
    if user
        user.admin ? admin_ability : user_ability
    else
        guest_ability
    end
  end

  def guest_ability
    can :read, :all
    can :manage, CartItem
    can :manage, Cart
    can :add_to_cart, Good
    can :create, Order
    can :create, User, admin: false
  end

  def user_ability
    guest_ability
    can :create, Order
    can(:edit, User) { |resource| resource == user }
    can(:update, User) { |resource| resource == user }
  end

  def admin_ability
    can :manage, :all
  end

end
