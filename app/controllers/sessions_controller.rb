class SessionsController < ApplicationController
  def create
    account = Account.send(env['omniauth.auth']['provider'], env['omniauth.auth'])
    if account
      session['account_id'] = account.id
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
