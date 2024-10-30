class Users::UsersController < UsersController
  before_action :authenticate, only: [ :profile ]
  before_action :unauthenticate, only: [ :login, :register ]

  def login
  end

  def create
    res = fetchAPI("/users/login", "post", false, nil, { "username" => params[:username], "password" => params[:password] })

    body = JSON.parse(res.body)

    if body["token"]
      session[:token] = body["token"]

      response = fetchAPI("/users/current_user", "get", true)

      session[:user] = JSON.parse(response.body)

      if session[:user]["id"]
        redirect_to users_home_path
      else
        render action: :login, alert: "System got error!!!"
      end
    else
      render action: :login, alert: body["error"]
    end
  end

  def profile
  end

  def update
  end

  def register
  end

  def submit
    form = {
      "username" => params[:username],
      "password" => params[:password],
      "date_of_birth" => params[:date_of_birth],
      "email" => params[:email],
      "gender" => params[:gender],
      "first_name" => params[:first_name],
      "last_name" => params[:last_name]
    }
    res = fetchAPI("/users/register", "post", false, nil, form)

    puts res.code

    if res.code == "201"
      redirect_to users_login_path, prompt: "Register successfully!!!"
    else
      errors = JSON.parse(res.body)
      render action: :register, alert: errors.each do |key, value|
        value
      end
    end
  end

  def destroy
    session[:user] = nil
    session[:token] = nil
    redirect_to action: :login
  end

  private
    def login_params
      params.require(:user).permit(:username, :password)
    end

    def unauthenticate
      if session[:user]
        redirect_to users_home_path, alert: "You need to logout to do that action."
      end
    end
end
