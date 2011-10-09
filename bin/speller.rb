#!/usr/bin/env ruby

require 'readline'

require File.expand_path(File.dirname(__FILE__) + '/../lib/spell_checker')

sc = SpellChecker.new

stty_save = `stty -g`.chomp
trap('INT') do 
  system('stty', stty_save)
  puts 'Thanks, quitting...'
  exit
end

while line = Readline.readline('Type a word: > ', true)
  suggestions = sc.correct(line)
  puts suggestions
end
