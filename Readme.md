Setup

#0. Be on Ruby 1.9.3#
Run the following in your terminal:
$> ruby -v
if it doesn’t return ruby 1.9.3p194,
##Windows##
1. http://rubyinstaller.org/ and download the installer for Ruby 1.9.3-p392
2. uninstall ruby 1.9.2 or lower if you have it
3. open your favorite text editor and create C:/Users/your_user_name/.bashrc
4. Write ```export PATH=/c/Ruby193/bin:/usr/bin:/usr/local/bin:``` at the top of the file and save
5. Go into your Git Bash and type ```. .bashrc``
6. Type ```ruby -v``` and you should see 1.9.3-p392!
7. If you're still having trouble, post to the facebook group or email a TM.
##Mac##
install rvm here: https://rvm.io/ and follow the directions for installing. Once rvm is installed, all you should have to do is
$> rvm install 1.9.3

#1. Install RubyGems#
We are going to install a ruby package manager called rubygems. You may have seen python packages (usually distributed as ‘eggs’ with a .egg ending). Ruby packages are really much, much nicer/easier. With rubygems installed, to install a gem (like rails, for instance):
`gem install rails`
to update:
`gem update rails`
at rubygems.org there are many gems that take care of functionality for you. Want to interface with twitter? There’s a gem for that. Not all gems are equal as far as documentation is concerned, so hunt around before making your choice, and be really sure before you decide to ‘roll-your-own’ implementation.

More on rubygems: http://docs.rubygems.org/


##Mac / Linux:##
Download rubygems-1.8.25.tgz
google how to untar files, and run the command to expand a gzipped tar file (.tgz)

##Windows##
rubygems-1.8.25.zip
unzip this file using your favorite unzipper, or the native windows compressed file extractor (whatever that may be)

##Both:##
in your terminal, cd into the directory (e.g. Downloads/rubygems-1.8.25/) and enter the commands:
```
ruby setup.rb
gem install sinatra
gem install rails
```

That was easy!
Congratulations, you’ve just installed Sinatra (http://www.sinatrarb.com/) and Ruby on Rails (http://rubyonrails.org/documentation).

Documentation (bookmark these links!)
You should be using Ruby 1.9.3. Ruby 2 just came out, but is not recommended for rails 3.2.

Ruby docs: http://www.ruby-doc.org/core-1.9.3/
Rails docs: http://api.rubyonrails.org


#2. Ruby Syntax#

First, a few vocabulary notes:

Ruby doesn’t have lists, it has arrays.
[ 1, 2, ’foo’, :jim, some_method ]

Ruby doesn’t have dictionaries, it has hashes.
{ :hash_key => :hash_value }

Ruby likes symbols. Symbols start with a colon (:)
hash = {:this => ‘bob’}
hash[:this] == ‘bob’ yields True
of course, you can always use integers, strings, and other data types as keys in hashes as well.

Ruby has something called a block that allows you to iterate over objects, manipulate them, and do all kinds of crazy stuff. 
Example:
```
array = [1,2,3]
array.each do |member|
    puts member
end
1
2
3
#=> [ 1, 2, 3]

array.map do |num|
    num ** 2
end.reverse
#=> [ 9, 4, 1]

array.inject(0) do |memo, num|
    memo += num
    num
end
#=> 6
```
#3. Okay, now the exercises:#

Fork & clone the github repo at https://github.com/RampUp/dev-sprint7

There should be two files:
example_ruby_scripts.rb
commands.txt

Open example_ruby_scripts.rb in your favorite text editor, and try to figure out what each method does--you should recognize all of them.
```
require '~/devrampup/week7/example_ruby_scripts.rb'
```
Replace the command path with the absolute path to the directory where the example ruby scripts file lives.

Test out the scripts, make sure they work, and try to pay close attention to how the syntax is slightly different from Python. Many of the concepts will be the same, though implementation may be slightly different. In particular, notice how you can chain methods...
```
$> array = [ 1, 2, 3, 4, 5]
$> array.reverse.sort.max.to_s.chars.first.to_i
```
The (rather contrived) method chain above takes the result of calling ‘array’, calls ‘reverse’ on that, calls ‘sort’ on the result of ‘reverse’, and so on. A more practical use case might be:
```
$> name = params[‘name’]
$> Blog.posts.where(‘author.name = ?’, name)
```

#4. Finished with the scripts? Excellent...#
Open up “commands.txt”. In it you will find a list of commands to execute in the ruby vm (accessed by typing ‘irb’ into the terminal).

Execute each command (in order, please) and take note on what that command returns. Write that in the file where it says “fill_in_what_irb_returns_here”.

#5. Bonus#

If you’re curious, follow the instructions in bonus_week_7.md -- note that you can open this file in github if you'd like the markdown to be prettified for you.

