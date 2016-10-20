# Strategy pattern is used for implementing each version of algorythm as a separate object
require 'active_support/inflector'
class CV
  attr_accessor :subject, :skills, :generator

  def initialize(subject, options)
    options[:skills]    ||= []
    options[:generator] ||= :pdf
    @subject = subject
    @skills = options[:skills]
    @generator = "#{options[:generator]}_generator".to_s.classify.constantize.new
  end

  def generate
    @generator.generate(self)
  end
end

class PdfGenerator
  def generate(context)
    puts '--------- PDF ----------'
    puts context.subject
    context.skills.each_with_index do |skill, i|
      puts "Skill ##{i}: #{skill}"
    end
    nil
  end
end

class DocGenerator
  def generate(context)
    puts '--------- DOC ----------'
    puts context.subject
    context.skills.each_with_index do |skill, i|
      puts "* Skill ##{i}: #{skill}"
    end
    nil
  end
end

cv = CV.new('Jon Snow', skills: ['javascript', 'archery', 'swords'])
cv.generator = DocGenerator.new
puts cv.generate
