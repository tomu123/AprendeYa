class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # user_signed_in? ? redirect_to(courses_path) : redirect_to(new_user_session_path)
  end

  def academic_record
    @enrollments = Enrollment.all
    @solutions = Solution.all
    @courses = Course.all
    @users = User.all
  end
end
