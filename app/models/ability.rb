class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new

    case controller_namespace
    when 'Admin'
      admin_roles user
    else
      public_roles user
    end

    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
  end

  def admin_roles(user)
    cannot :manage, :all
    can :manage, :all if user.has_role? 'admin'
  end

  def public_roles(user)
    # Sections
    can :read, Section
    cannot [:create, :update, :destroy], Section

    # Posts
    can [:read, :create], Post
    can :update, Post, user_id: user.id
    cannot :destroy, Post

    # Replies
    can [:read, :create], Reply
    can :update, Reply, user_id: user.id
    cannot :destroy, Reply

    # Profiles
    can :show, User
    cannot :index, User

    # Admins can do anything!
    can :manage, :all if user.has_role? 'admin'
  end

end
