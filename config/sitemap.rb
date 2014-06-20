# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://localhost:3000'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.sitemaps_host = ENV['SITEMAP_HOST']
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'


SitemapGenerator::Sitemap.create do
  Book.find_each do |book|
    add book_path(book), lastmod: book.updated_at
  end
end

SitemapGenerator::Sitemap.ping_search_engines
