class Users::VocabularyController < UsersController
  skip_before_action :authenticate
  def index
  end
end
