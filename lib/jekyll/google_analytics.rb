require 'jekyll/google_analytics/version'
require 'jekyll'

module Jekyll
  module GoogleAnalytics
    TEMPLATE = <<-TEMPLATE
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', '%s', 'auto');
        ga('send', 'pageview');
      </script>
    TEMPLATE

    class Tag < ::Liquid::Tag
      def render(context)
        site = context.registers[:site]
        site.config['google_analytics_code'] ||= begin
          analytics_settings = site.config['google_analytics']
          return unless analytics_settings && analytics_settings.key?('tracking_code')
          format(TEMPLATE, analytics_settings['tracking_code'])
        end
      end
    end
    ::Liquid::Template.register_tag('google_analytics', Tag)
  end
end
