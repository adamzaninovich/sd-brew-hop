module BreweriesHelper
  def format_url url
    url = url.gsub %r{http://(www.)?}, ""
    url.gsub! %r{/$}, ''
    truncate url, length: 30
  end
end
