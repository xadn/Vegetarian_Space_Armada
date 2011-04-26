# Using declarative_authorization.
authorization do
  
  role :member do
    has_permission_on :members_members, :to => :read 
    
    has_permission_on :members_user, :to => :read
    has_permission_on :members_user, :to => [:update, :delete] do
      if_attribute :id => is {user.id}
    end
    
    has_permission_on :members_destroyers, :to => [:read, :create]
    has_permission_on :members_destroyers, :to => [:update, :delete] do
        if_attribute :id => is {user.id}
    end
    
    has_permission_on :members_favorites, :to => :manage do
      if_attribute :id => is {user.id}
    end    
  end
  
  role :administrator do
    includes :member
    has_permission_on :admin_favorites, :to => :manage
    has_permission_on :admin_admin, :to => :read
    has_permission_on :admin_users, :to => :manage
    has_permission_on :admin_roles, :to => :manage
    has_permission_on :admin_destroyers, :to => :manage
  end
  
  role :developer do
    includes :administrator
  end
  
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => [:edit]
  privilege :delete, :includes => :destroy
end
