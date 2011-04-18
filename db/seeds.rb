PaperTrail.whodunnit = 'Seed Data Script'


# Seed the roles.
Role.create!(:name => 'developer', :description => 'The system developer. There is no higher access level.')
Role.create!(:name => 'administrator', :description => 'A system administrator. Full access to all features.')
Role.create!(:name => 'member', :description => 'A typical application user.')


# Seed developer users.
r = Role.find_by_name('developer')
m = Role.find_by_name('member')

andy = User.new(
    :first_name => 'Andy',
    :last_name => 'Niccolai',
    :email => 'adnap4@gmail.com',
    :password => 'changeme',
    :password_confirmation => 'changeme',
    :role => r
  )
andy.save_without_session_maintenance

amanreet = User.new(
    :first_name => 'Amanreet',
    :last_name => 'Bajwa',
    :email => 'abajwa@mines.edu',
    :password => 'changeme',
    :password_confirmation => 'changeme',
    :role => r
  )
amanreet.save_without_session_maintenance

yong = User.new(
    :first_name => 'Yong',
    :last_name => 'Bakos',
    :email => 'ybakos@mines.edu',
    :password => 'changeme',
    :password_confirmation => 'changeme',
    :role => r
    )
yong.save_without_session_maintenance

john = User.new(
    :first_name => 'John',
    :last_name => 'Doe',
    :email => 'john@example.com',
    :password => 'password',
    :password_confirmation => 'password',
    :role => m
  )
john.save_without_session_maintenance


# Seed destroyers.
Destroyer.create(
    :name => "Enterprise",
    :price => 5000,
    :user => andy,
    :description => "We'll pick you up!"
  )

Destroyer.create(
    :name => "Enterprise2",
    :price => 5000,
    :user => john,
    :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )
    
Destroyer.create(
    :name => "Enterprise3",
    :price => 5000,
    :user => john,
    :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )

Destroyer.create(
    :name => "Enterprise4",
    :price => 5000,
    :user => john,
    :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )

Destroyer.create(
    :name => "Enterprise5",
    :price => 5000,
    :user => john,
    :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )