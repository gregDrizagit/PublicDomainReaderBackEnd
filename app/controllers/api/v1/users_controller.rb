class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def currently_reading
    users = User.all


    serialized_bookmarks = users.collect do |user|
        BookmarkSerializer.new(user.bookmarks.last)
    end
    # serialized_bookmarks = users_currently_reading.collect do |bookmark|
    # end
    if serialized_bookmarks
      render json: serialized_bookmarks, status: 200
    else
      render json: {errors: "nobody is reading anything"}
    end
  end

  def test
    100.times do
      puts "IT WORKED"
    end

    render html: 'TEST'
  end

end
