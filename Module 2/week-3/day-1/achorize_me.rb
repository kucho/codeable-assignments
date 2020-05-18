# frozen_string_literal: true

# Parse the text and replace Globally url with corresponding html syntax.
#
#     Supported protocols:
#
#     http
#     https
#     ftp
#     ftps
#     file
#     smb
#     NOTE: Ideal will be with ** Regex **
#
#     Input
#     'hello FTP://world.com !'
#
#     Output
#     'hello <a href="FTP://world.com">FTP://world.com</a> !'
#
#     Input
#     'hello http://world.com !'
#
#     Output
#     'hello <a href="http://world.com">http://world.com</a> !'

def anchorize(text)
  text.gsub(/(http|https|ftp|ftps|file|smb)[^\s]*/i) do |url|
    "<a href=\"#{url}\">#{url}</a>"
  end
end

puts anchorize('hello http://world.com !')
