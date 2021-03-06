module HelperMethods

  def register_user
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'user_login').displayed?}
    @login = 'user'+rand(99999).to_s
    @password = 'Qwerty11'
    @driver.find_element(:id, 'user_login').send_keys(@login)
    @driver.find_element(:id, 'user_password').send_keys(@password)
    @driver.find_element(:id, 'user_password_confirmation').send_keys(@password)
    @driver.find_element(:id, 'user_firstname').send_keys(@login)
    @driver.find_element(:id, 'user_lastname').send_keys(@login)
    @driver.find_element(:id, 'user_mail').send_keys(@login + '@q.com')
    @driver.find_element(:name, 'commit').click
  end

  def register_user1
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @wait.until {@driver.find_element(:id, 'user_login').displayed?}
    @login1 = 'user'+rand(99999).to_s
    @password = 'Qwerty11'
    @driver.find_element(:id, 'user_login').send_keys(@login1)
    @driver.find_element(:id, 'user_password').send_keys(@password)
    @driver.find_element(:id, 'user_password_confirmation').send_keys(@password)
    @driver.find_element(:id, 'user_firstname').send_keys(@login1)
    @driver.find_element(:id, 'user_lastname').send_keys(@login1)
    @driver.find_element(:id, 'user_mail').send_keys(@login1 + '@q.com')
    @driver.find_element(:name, 'commit').click
  end

  def login_user
    if @driver.find_element(:class, 'logout').displayed?
      @driver.find_element(:class, 'logout').click
    end
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_keys @login
    @driver.find_element(:id, 'password').send_keys @password
    @driver.find_element(:name, 'login').click
  end

  def change_password
    @new_password = @password + '1'
    @driver.find_element(:class, "my-account").click
    @driver.find_element(:class, 'icon-passwd').click
    @driver.find_element(:id, "password").send_keys(@password)
    @driver.find_element(:id, "new_password").send_keys(@new_password)
    @driver.find_element(:id, "new_password_confirmation").send_keys(@new_password)
    @driver.find_element(:name, "commit").click
  end

  def create_project
    @driver.find_element(:class, "projects").click
    @driver.find_element(:class, 'icon-add').click
    @project_name = 'Project' + rand(9999).to_s
    @driver.find_element(:id, "project_name").send_keys(@project_name)
    @driver.find_element(:name, "commit").click
  end

  def create_project_version
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:css, "#tab-content-versions .icon-add").click
    @version_name = 'version'+rand(99999).to_s
    @driver.find_element(:id, 'version_name').send_keys(@version_name)
    @driver.find_element(:name, "commit").click
  end

  def create_issue(type)
    @issue_subject = 'subject' + rand(99999).to_s
    @driver.find_element(:class, "new-issue").click
    @wait.until {@driver.find_element(:id, "issue_subject").displayed?}
    @driver.find_element(:id, "issue_subject").send_keys(@issue_subject)
    option = Selenium::WebDriver::Support::Select.new(@driver.find_element(:id => "issue_priority_id"))
    option.select_by(:text, "#{type}")
    @driver.find_element(:name, "commit").click
  end

  def add_user
    @driver.find_element(:id, "tab-members").click
    @driver.find_element(:css, "#tab-content-members .icon-add").click
    @wait.until {@driver.find_element(:id, "principal_search").displayed?}
    @driver.find_element(:id, "principal_search").send_keys(@login1)
    @wait.until {@driver.find_element(:xpath, "//*[.='(1-1/1)'] ").displayed?}
    @driver.find_element(:css, "#principals input").click
    @driver.find_element(:css, ".roles-selection input[value='3']").click
    @driver.find_element(:id, "member-add-submit").click
    @wait.until {!@driver.find_element(:id, "principal_search").displayed?}
    @driver.find_element(:class, "home").click
    @wait.until {@driver.find_element(:link, "#{@project_name}").displayed?}
    @driver.find_element(:link, "#{@project_name}").click
  end

  def edit_user
    @driver.find_element(:id, "tab-members").click
    @driver.find_element(:css, "a.icon.icon-edit").click
    @driver.find_element(:css, "input[type='checkbox'][value='4']").click
    @driver.action.send_keys(:enter).perform
  end

end