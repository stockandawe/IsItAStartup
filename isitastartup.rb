#! /usr/bin/ruby

QPROMPT = "Ask yourself: "

question_hash = Hash[
              "How big is the market (in billions of dollars)?" => [0.1, "the market is too small"],
              "How many people have you spoken to who said they will use this?" => [20, "if you can't get 20 people you know to use it, its gonna be tough to convvenience strangers"],
              "If this existed today, would you use it?" => ["yes", "if you don't need it, chances are a lot of people don't even if its reall cool"],
              "Does this have a revenue model that your mom will understand?" => ["yes", "if the revenue model is not simple at this stage, chances are there won't be a revenue model later on"], 
              "How many competitors are there in the market?" => [3, "too few competitors in the market - Not likely if the market is big and real"],
              "Will people use it on their mobile phones (yes/no)?" => ["yes", "if people can't/won't use it on their mobile phone, it's not going to be used"],
              "How many founders are on the team?" => [2, "it's too hard if you are the only one working on this. Even Zuck needed cofounders"], 
              "Are all founders working full time on it (yes/no)?" => ["yes","non-fulltime founders is a problem - if not now, soon"], 
              "Can any of the founders write code (yes/no)?" => ["yes", "if one of you can't code, it's not happening"],
              "Its 5 years from now, has your product changed the world (yes/no)?" => ["yes", "without an audacious goal of changing the world, its not worth it"]
             ]

def notastartup(why)
  puts "You might wanna think about this a little more."
  puts "Because "+why
  exit
end

puts "Welcome entrepreneur, let's get started"
puts "What's your name?"
entrepreneur = gets.chomp 
cntr = 0
question_hash.each_pair do |question,value|
  puts QPROMPT + question 
  print entrepreneur+"> "
  ans = gets.chomp
  if (value.first.class == "string".class)
    if (ans.to_s != value.first)
      notastartup(value.last)
    end
  else
    if (ans.to_i < value.first)
      notastartup(value.last)
    end
  end
  cntr = cntr + 1
  if (cntr == question_hash.length)
    # Looking good, go for it
    puts "Go for it, and don't stop till you are done"
    exit
  end
end

puts "If you got here, there is a bug. Fix it, use it, and then go and build your own startup (or not)"
