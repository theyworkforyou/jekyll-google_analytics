require 'test_helper'

class Jekyll::GoogleAnalyticsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::GoogleAnalytics::VERSION
  end

  def test_generating_analytics_code
    site = Jekyll::Site.new(Jekyll.configuration)
    site.config['google_analytics'] = {
      'tracking_code' => 'UA-123-1'
    }
    tmpl = Liquid::Template.parse('{% google_analytics %}')
    tmpl.registers[:site] = site

    expected = <<-TEMPLATE
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-123-1', 'auto');
        ga('send', 'pageview');
      </script>
    TEMPLATE
    assert_equal expected, tmpl.render
  end
end
