 module ControllerMacros
   def login_user(role = 'member')
     before(:each) do
       request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryGirl.create(:user, {role:role})
       user.confirm!
       sign_in user
     end
   end
 end
