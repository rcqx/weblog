# frozen_string_literal: true

class Ability
  
  # Add in CanCan's ability definition DSL
  include CanCan::Ability

  def initialize(user)
    return unless user.present?  # additional permissions for logged in users (they can read their own posts)
    can :delete, Post, user: user
    can :delete, Comment, user: user

    return unless user.admin?  # additional permissions for administrators
    can :delete, Post
    can :delete, Comment
  end
end
