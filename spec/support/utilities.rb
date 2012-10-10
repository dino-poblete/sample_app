include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

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

