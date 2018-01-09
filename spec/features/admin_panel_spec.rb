require 'rails_helper'

RSpec.feature "AdminPanel", type: :feature do
  include LoginSupport
  include_context 'users'
  let(:admin_panel) { AdminPage.new }
  let(:home_page)  { Home.new }
  let(:dish) { FactoryBot.build_stubbed(:dish) }
  let(:pinned_post) { FactoryBot.build_stubbed(:pinned_post) }

  feature 'admin navigates to admin panel' do
    before do
      @users = FactoryBot.create_list(:user, 5)
    end

    scenario 'and sees proper admin panel' do
      go_to_admin_panel
      expect(admin_panel).to be_displayed
      expect_admin_panel_nav
      expect_proper_admin_panel
    end

    scenario 'and can add user' do
      go_to_admin_panel
      visit 'users/new'
      fill_in "user_first_name", with: 'dupa jest obsrana'
      create_user
      # expect(page).not_to have_content('User was not created.')
    end

    scenario 'and can add dish' do
      go_to_admin_panel
      visit 'dishes/new'
      expect{ create_dish }.to change(Dish, :count).by(1)
      expect_redirect_to_dish_list
    end

    scenario 'and can add pinned post' do
      go_to_admin_panel
      visit 'pinned_posts/new'
      expect { create_pinned_post }.to change(admin.pinned_posts, :count).by(1)
      expect(page).to have_content(pinned_post.content)
    end
  end

  private

  def go_to_admin_panel
    log_in_as(admin)
    admin_panel.load
  end

  def expect_proper_admin_panel
    admin_panel_has_action_buttons
    admin_panel_has_all_sections
    employees_section_displays_employees
    income_section_displays_charts_and_income
    orders_section_displays_all_charts
    expect(admin_panel).to have_footer
  end

  def admin_panel_has_action_buttons
    expect(admin_panel).to have_actions
  end

  def admin_panel_has_all_sections
    expect(admin_panel).to have_employees
    expect(admin_panel).to have_income_section
    expect(admin_panel).to have_orders_section
    expect(admin_panel).to have_dishes_chart_section
  end

  def employees_section_displays_employees
    expect(admin_panel.employees).to have_user
  end

  def income_section_displays_charts_and_income
    income_section = admin_panel.income_section
    expect(income_section).to have_income_chart
    expect(income_section).to have_income_numbers
  end

  def orders_section_displays_all_charts
    charts = admin_panel.orders_section.orders_charts
    expect(charts).to have_all_orders
    expect(charts).to have_all_employees
    expect(charts).to have_daily_comparison
  end

  def expect_admin_panel_nav
    expect(admin_panel.menu).to have_admin_button
    expect(admin_panel.menu).to have_left_nav
    expect(admin_panel.menu).to have_avatar
    expect(admin_panel.menu).to have_search
  end

  def expect_redirect_to_dish_list
    aggregate_failures do
      expect(page).to have_title('Arbejder | Dish List')
      expect(page).to have_content(dish.name)
      expect(page).to have_content(dish.price)
    end
  end

  def create_user
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'E-mail address', with: user.email
    fill_in 'City', with: user.city
    fill_in 'Password', with: user.password
    fill_in 'Confirm password', with: user.password
    click_button 'Add'
  end

  def create_dish
    fill_in 'Name', with: dish.name
    fill_in 'Price', with: dish.price
    fill_in 'Description', with: dish.description
    click_button 'Save changes'
  end

  def create_pinned_post
    fill_in 'pinned_post_content', with: pinned_post.content
    click_button 'Post'
  end
end
