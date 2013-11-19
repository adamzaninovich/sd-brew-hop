module ActivitiesHelper
  def user_for_activity activity
    if activity.owner
      if activity.owner == current_user
        "You"
      else
        link_to activity.owner.name, '#activity.owner'
      end
    else
      "Someone"
    end
  end
end
