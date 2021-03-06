def sign_up_correctly
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_mismatch_passwords
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'not_matching'
  click_button 'Sign up'
end

def sign_up_no_email
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_invalid_email
  visit '/sign-up'
  fill_in :username, with: 'quentin_tarentino'
  fill_in :email, with: 'qt_pie@gmailcom'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def sign_up_same_email
  sign_up_correctly
  sign_up_correctly
end

def log_in_correctly
  visit '/log-in'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Log in'
end

def log_in_incorrectly
  visit '/log-in'
  fill_in :email, with: 'qt_pie@gmail.com'
  fill_in :password, with: 'jazzyiscool'
  click_button 'Log in'
end

def add_space
  sign_up_correctly
  click_button "add_space"
  fill_in :name, with: "chris's space"
  fill_in :description, with: "a lovely calming space"
  fill_in :price, with: 20
  fill_in :start_date, with: '2016/04/10'
  fill_in :end_date, with: '2016/06/15'
  click_button('submit')
end

def add_two_spaces
  add_space
  add_another_space
end

def add_another_space
  click_button "add_space"
  fill_in :name, with: "nick's space"
  fill_in :description, with: "a luxurious and decadent space"
  fill_in :price, with: 200
  fill_in :start_date, with: '2016/04/20'
  fill_in :end_date, with: '2016/08/18'
  click_button('submit')
end

def make_request
  add_space
  user_2_sign_up
  click_button 'request'
end

def request_space
  make_request
  fill_in :start_date, with: '2016/05/01'
  fill_in :end_date, with: '2016/05/02'
  click_button 'Submit'
end

def user_2_sign_up
  visit '/sign-up'
  fill_in :username, with: 'dweeb'
  fill_in :email, with: 'dweeb@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :password_confirmation, with: 'password123'
  click_button 'Sign up'
end

def filter_spaces_after_booking
  request_space
  log_in_correctly
  click_button "my_spaces"
  click_button "accept"
  visit '/spaces'
  add_another_space
end
