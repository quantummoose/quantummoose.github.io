require 'rubygems'
require 'rake'
require 'rdoc'
require 'date'
require 'yaml'
require 'tmpdir'
require 'jekyll'

desc "Generate blog files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end


desc "Generate and publish blog to master" # edited, swapping gh-pages -> master, and master -> servant
task :publish => [:generate] do
  Dir.mktmpdir do |tmp|
    system "robocopy _site #{tmp} /E /MOVE > nul"
    system "git checkout -B master"
    system "rm -rf -rq *"
    system "robocopy #{tmp} . /E /MOVE > nul"
    message = "Site updated at #{Time.now.utc}"
    system "git add ."
    system "git commit -am #{message}"
    system "git push origin master --force"
    system "git checkout servant"
    system "echo yolo"
  end
end

task :default => :publish
