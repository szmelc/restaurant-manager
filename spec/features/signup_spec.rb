require 'rails_helper'

RSpec.feature "SignUp", type: :feature do
  let(:signup_page)   { SignUpPage.new }
  let(:user)          { FactoryBot.build(:user) }

  feature 'I want user to sign up' do
    context 'with valid details' do
      scenario 'and create account successfuly' do
        signup_page.load
        fill_in_user_details_correctly
        aggregate_failures do
          expect { signup_page.signup_button.click }.to change(User, :count).by(1)
          expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
        end
      end
    end

    context 'with invalid details' do
      context 'with first name missing' do
        scenario 'and be redirected to signup form' do
          signup_page.load
          fill_registration_form_without_first_name
          expect { signup_page.signup_button.click }.not_to change(User, :count)
          expect(page).to have_content('Sign Up')
        end
      end

      context 'without last name' do
        scenario 'nd be redirected to signup form' do
          signup_page.load
          fill_registration_form_without_last_name
          expect { signup_page.signup_button.click }.not_to change(User, :count)
          expect(page).to have_content('Sign Up')
        end
      end

      context 'with different passwords' do
        scenario 'nd be redirected to signup form' do
          signup_page.load
          fill_form_with_different_passwords
          expect { signup_page.signup_button.click }.not_to change(User, :count)
          expect(page).to have_content('Sign Up')
        end
      end

    end
  end

  private

  def type_matching_passwords
    signup_page.user_password.set user.password
    signup_page.user_password_confirmation.set user.password
  end

  def fill_first_and_last_name
    signup_page.user_first_name.set user.first_name
    signup_page.user_last_name.set user.last_name
  end

  def fill_in_user_details_correctly
    fill_first_and_last_name
    signup_page.user_email.set user.email
    signup_page.user_city.set user.city
    type_matching_passwords
  end

  def fill_registration_form_without_first_name
    signup_page.user_last_name.set user.last_name
    signup_page.user_email.set user.email
    signup_page.user_city.set user.city
    type_matching_passwords
  end

  def fill_registration_form_without_last_name
    signup_page.user_first_name.set user.first_name
    signup_page.user_email.set user.email
    type_matching_passwords
    signup_page.user_password_confirmation.set user.password
  end

  def fill_form_with_different_passwords
    fill_first_and_last_name
    signup_page.user_email.set user.email
    signup_page.user_city.set user.city
    signup_page.user_password.set user.password
    signup_page.user_password.set 'lol1337'
  end
end
