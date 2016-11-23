module MessagesHelper
  def recipients_options
    options_for_select(User.all.map { |user| [user.name, user.id] })
  end
end
