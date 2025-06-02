# frozen_string_literal: true

require_relative "lib/irb/theme/huston/version"

Gem::Specification.new do |spec|
  spec.name = "irb-theme-huston"
  spec.version = Irb::Theme::Huston::VERSION
  spec.authors = ["ksaito"]
  spec.email = ["kitsit.39@gmail.com"]

  spec.summary = "IRB color theme"
  spec.description = "IRB color theme"
  spec.homepage = "https://github.com/ksaito422/irb-theme-huston"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "reline", ">= 0.4.0"
end
