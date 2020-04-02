module PostsHelper
  def bloodytype_select
    bt = [['AB+', 'AB+'], ['AB-', 'AB-'], ['A+', 'A+'], ['A-', 'A-'],
          ['B+', 'B+'], ['B-', 'B-'], ['O+', 'O+'], ['O-', 'O-']]
    bt
  end

  def donator_check(post, current_user)
    date = Date.today << 3
    post.donator.blank? && !current_user.admin? && current_user.last_donated_date < date
  end

  def volunteer_show_check(post, current_user)
    post.donator.blank? && current_user.admin? && Volunteer.exists?(post_id: post)
  end
end
