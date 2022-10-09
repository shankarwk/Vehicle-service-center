class UserMailer < ApplicationMailer
    default from: 'shankarhurpude249@gmail.com'
    def order_mail
        mail(to:params[:email],subject:"This is webkorps maile")
    end
end
