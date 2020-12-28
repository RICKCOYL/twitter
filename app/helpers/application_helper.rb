module ApplicationHelper
    def user_image(user)
        if user.photo.attached?
          user.photo
        else
          gravatar_image_url(user.username)
        end
      end

      def user_followers(user)
        if user.followers.any?
          render 'posts/userfollowers', user: user
        end
      end
end
