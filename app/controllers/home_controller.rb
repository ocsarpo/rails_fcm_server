class HomeController < ApplicationController
  require 'fcm'
  skip_before_action :verify_authenticity_token, :only => [:regi_token, :send_message]
  @@fcm = FCM.new(ENV['FIREBAES_SERVER_KEY'])

  def index
  end

# https://firebase.google.com/docs/cloud-messaging/android/client
  # POST /regi_token
  def regi_token
    t = Token.new(token: params[:token])
    t.save
  end

  def send_message
    from = params[:from]
    to = params[:to]
    msg = params[:msg]

    t = Token.find(to)
    f = Token.find(from)
    regi_id = Array.new
    regi_id << t.token

    options = {data: {message: from+"님 께서"+msg+"라고 보냄"}, collapse_key: "new_message"}
    response = @@fcm.send(regi_id, options)
  end
end
