class SessionsController < ApplicationController
  def create
    user = User.send(env['omniauth.auth']['provider'], env['omniauth.auth'])
    if user.save
      session['user_id'] = user.id
      flash[:success] = 'Logged in!'
    else
      flash[:error] = 'Ferification was failed!'
    end
    redirect_to :root
  end

  def destroy
    reset_session
    redirect_to :root, flash: { success: 'Logged Out!' }
  end
end
