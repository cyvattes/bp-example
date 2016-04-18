class VisitorsController < ApplicationController
  def index
  end

  def contact
    mailer = JSON.generate({ 'name' => mailer_params[:name],
      'email' => mailer_params[:email],
      'message' => mailer_params[:message] })
    # PostmanWorker.perform_async(mailer, 5)
    PostmanWorker.perform_in(2.minutes, mailer, 5)
    redirect_to :root
    # render 'index'
  end

  private

  def mailer_params
    params.require(:mailer).permit(:name, :email, :message)
  end
end
