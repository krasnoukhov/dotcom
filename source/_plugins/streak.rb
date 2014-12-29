require "open-uri"

module Jekyll
  module Streak
    def streak(user)
      return "" unless user

      uri = "https://github.com/#{user}"
      result = open(uri).read

      result[/<span\sclass="text-muted">Current streak<\/span>.*<span\sclass="contrib-number">([^<]+)<\/span>/m, 1]
    end
  end
end

Liquid::Template.register_filter(Jekyll::Streak)
