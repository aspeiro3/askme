module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declension_of_words(number, option_one, option_two, option_three)
    ostatok = number % 10
    ostatok_11_14 = number % 100

    if ostatok.between?(5, 9) || ostatok == 0 || ostatok.between?(11, 14)
      return option_three
    end
    return option_one if ostatok == 1
    return option_two if ostatok.between?(2, 4)
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
