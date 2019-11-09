# frozen_string_literal: true

require 'mail'

mail = Mail.new do
  from 'sample@gmail.com' # #送信元メールアドレス
  to 'sample+reciever@gmail.com' # #送信先メールアドレス
  subject 'Sample Mail from Ruby on Rails' # #メール件名
  body 'This is sample page.' # #メール本文
end

mail.delivery_method :smtp, address: 'smtp.gmail.com',
                            port: 587,
                            address: 'smtp.gmail.com',
                            domain: 'smtp.gmail.com',
                            user_name: 'standerd.media1234@gmail.com',
                            password: 'zqdpjaitehounvom'

mail.deliver
