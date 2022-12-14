class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:manage, Recipe, user:)
  end
end
