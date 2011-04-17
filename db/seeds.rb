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

user = User.new(
    :first_name => 'user',
    :last_name => 'user',
    :email => 'user@example.com',
    :password => 'user',
    :password_confirmation => 'user',
    :role => m
  )
user.save_without_session_maintenance


# Seed destroyers.
Destroyer.create(
    :name => "Enterprise",
    :description => "We'll pick you up!",
    :price => 5000,
    :user => andy 
  )
                
Destroyer.create(
    :name => "Enterprise2",
    :description => "We'll pick you up!",
    :price => 5000,
    :user => andy 
  )
                  
Destroyer.create(
    :name => "Enterprise3",
    :description => "We'll pick you up!",
    :price => 5000,
    :user => amanreet 
    )