# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Settings.host

SitemapGenerator::Sitemap.create do
  Shark.where(status: Shark::Status::RELEASE).each do |shark|
    add shark_path("#{shark.id}-#{shark.name}"), priority: 1.0, changefreq: 'always', lastmod: shark.updated_at
  end

  User.all.each do |user|
    if user.sharks.count > 0
      add developer_path("#{user.id}-#{user.name}"), priority: 1.0, changefreq: 'always', lastmod: user.updated_at
    end
  end
end
