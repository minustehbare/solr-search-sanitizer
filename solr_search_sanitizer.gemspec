Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solr_search_sanitizer'
  s.version     = '0.1.0'
  s.summary     = 'Provides sanitizer methods for SOLR queries.'
  s.description = 'Provides sanitizer methods for SOLR queries.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'minustehbare'
  s.email             = 'minustehbare@gmail.com'
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = 'actionmailer'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

end
