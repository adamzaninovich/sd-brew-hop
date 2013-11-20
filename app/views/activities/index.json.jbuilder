json.array! @activities do |activity|
  json.type activity.trackable_type.downcase

  json.user do
    name = if activity.owner_id?
      activity.trackable.user_name current_user
    else
      'Someone'
    end
    json.name name
    json.image activity.owner.image
  end

  json.trackable do
    if activity.trackable_type == 'Hop'

    end
  end

end
