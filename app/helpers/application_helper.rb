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
<<<<<<< HEAD
    return option_two if ostatok.between?(2, 4)
=======
    return option_two if ostatok >= 2 && ostatok <=4
>>>>>>> 20178fdb709b5e63dc595d677a4ec1b13e603979
  end
end
