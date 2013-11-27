require "bundler/gem_tasks"
require 'rdoc/task'

$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task :default => :spec

desc "Espectativas de la clase Matriz"
task :test do
        sh "rspec -I. spec/matrix_dd_lpp-t16_spec.rb --format documentation"
end

desc "Pruebas unitarias de las clases Matriz_Densa y Matriz_Dispersa (hija)"
task :tc do
        sh "ruby -I. test/test_matriz.rb --format documentation"
end

Rake::RDocTask.new do |rd|
    rd.main = "README.md"
    rd.rdoc_files.include("README.md", "lib/**/*.rb")
end
