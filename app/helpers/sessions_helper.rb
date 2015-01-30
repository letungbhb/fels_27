module SessionsHelper
	#dang nhap
	def log_in(user)
		session[:user_id]=user.id
	end
	#dang xuat
	def log_out
		session.delete(:user_id)
		@current_user=nil
	end
	#tra lai nguoi dung dang dang nhap
	def current_user
     	@current_user ||= User.find_by(id: session[:user_id])
  	end
  	#tra lai gia tri true neu da dang nhap,false neu chua dang nhap
  	def logged_in?
  		!current_user.nil?
  	end
end
