# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, Trip do |trip|
      user == trip.user
    end

      can :update, User do |user|
      user == user
    end

    can :update, User do |password|
      user == user.password
    end

  end

end
