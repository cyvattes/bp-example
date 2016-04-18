class PostmanWorker
  include Sidekiq::Worker

  def perform(mailer, count)
    mailer = JSON.load(mailer)
    VisitorMailer.contact_email(mailer['name'], mailer['email'], mailer['message']).deliver
  end
end
