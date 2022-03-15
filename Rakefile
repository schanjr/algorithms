require 'yard'
require 'pry'
require 'rake'

task :get_readme do
  Dir['**/*'].select {|x| x =~ /_.*(md)/ }.sort
end

task :list_readme do
  puts Dir['**/*'].select {|x| x =~ /_.*(md)/ }.sort
end

task :get_assets do
  rex = /_.*(png|gif|jpg|jpeg|svg)/
  assets = Dir['**/**/**'].select {|x| x =~ rex }.sort
  assets -= Dir['doc/**/**'].select {|x| x =~ rex }.sort
  assets
end

YARD::Rake::YardocTask.new do |t|
  readme_files = Rake::Task["get_readme"].invoke.first.call
  t.files = ['**/*.rb', '!scratch/**'] # optional
  t.options = ["--main=README.md", "--files=#{readme_files.join(',')}"]
end

task :doc do
  Rake::Task["yard"].invoke
  cp_r('assets', 'doc/assets')
  assets = Rake::Task["get_assets"].invoke.first.call
  assets.each do |files|
    cp_r(files, "doc/assets/")
  end
end


