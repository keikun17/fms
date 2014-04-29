# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{orderedhash}
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ara T. Howard"]
  s.date = %q{2008-12-17}
  s.email = %q{ara.t.howard@gmail.com}
  s.files = ["gemspec.rb", "install.rb", "lib", "lib/orderedautohash.rb", "lib/orderedhash.rb"]
  s.homepage = %q{http://codeforpeople.com/lib/ruby/orderedhash/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{codeforpeople}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{orderedhash}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
