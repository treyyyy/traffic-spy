require './test/test_helper'

class UserViewsApplicationDetails < FeatureTest

  def test_the_page_displays_the_most_requested_URLS_to_least_requested_URLS
    visit 'http://yourapplication:port/sources/jumpstartlab'
    assert_equal '/sources/jumpstartlab', current_path
    within('#urls') do
    assert page.has_content?('http://jumpstartlab.com')
   end
  end

  def test_the_page_displays_web_browser_breakdown_across_all_requests
    visit 'http://yourapplication:port/sources/jumpstartlab'
    assert_equal '/sources/jumpstartlab', current_path
    within('#browser-breakdown') do
    assert page.has_content?('Chrome')
  end

  def test_an_OS_breakdown_across_all_requests_
    visit 'http://yourapplication:port/sources/jumpstartlab'
    assert_equal '/sources/jumpstartlab', current_path
    within('#OS-breakdown') do
    assert page.has_content?('Macintosh')
  end
end

# As a client
# When I visit http://yourapplication:port/sources/IDENTIFIER
# And that  identifer exists
# xxxxx Then I should see a page that displays the most requested URLS to least requested URLS (url)
# xxxxx And I should see a web browser breakdown across all requests (userAgent)
# xxxxx And I should see an OS breakdown across all requests (userAgent)
# And I should see Screen Resolutions across all requests (resolutionWidth x resolutionHeight)
# And I should see a Longest, average response time per URL to shortest, average response time per URL
# And I should see a Hyperlinks of each url to view url specific data
# And I should see a Hyperlink to view aggregate event data
#
# As a client
# When I visit http://yourapplication:port/sources/IDENTIFIER
# And the identifier does not exist
# Then I should see a "Some notification message"