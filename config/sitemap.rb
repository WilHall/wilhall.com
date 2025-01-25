SitemapGenerator::Sitemap.default_host = "https://wilhall.com/"
SitemapGenerator::Sitemap.ping_search_engines

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  add about_path, :priority => 0.7
  add writings_path, :priority => 0.7
  add presses_path, :priority => 0.7
  add lessons_path, :priority => 1.0
  add studio_share_path, :priority => 1.0
  add studio_path, :priority => 0.7
  add kiln_share_path, :priority => 1.0
  add store_path, :priority => 1.0
  add contact_path, :priority => 0.7
  add purpose_path, :priority => 0.7
end
