include ApplicationHelper

# DEFINE METHODS #

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end


# DEFINE MATCHERS #
RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_h1_header do |message|
  match do |page|
    page.should have_selector('h1', text: message)
  end
end

RSpec::Matchers.define :have_title do |message|
  match do |page|
    page.should have_selector('title', text: message)
  end
end

RSpec::Matchers.define :have_profile_link do 
  match do |page|
    page.should have_link('Profile', href: user_path(user))
  end
end

RSpec::Matchers.define :have_users_link do 
  match do |page|
    page.should have_link('Users', href: users_path)
  end
end


RSpec::Matchers.define :have_settings_link do 
  match do |page|
    page.should have_link('Settings', href: edit_user_path(user))
  end
end


RSpec::Matchers.define :have_signout_link do 
  match do |page|
    page.should have_link('Sign out', href: signout_path)
  end
end

RSpec::Matchers.define :have_signin_link do
  match do |page|
    page.should have_link('Sign in', href: signin_path)
  end
end

