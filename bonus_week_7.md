#BONUS#
Not tired of sprint 7 yet? Want to learn something else about 
Github? Excellent...read on :)

#1. Rebasing#
Rebasing is a technique that helps keep your master branch clean. A typical workflow for a company will (hopefully) look like some variation of:

Develop a feature or bugfix on a branch called 
```feature/feature_name``` or ```fix/fix_name_or_issue_number```

Submit a pull request for that branch when it's done to the Develop branch so it can be reviewed by peers. When someone signs off on the pull request with an 'lgtm' (looks good to me), the feature branch is merged into Develop.

Hopefully Develop and Staging are somewhat synonymous--this is where code lives while it's being tested. Eventually, everything in Develop will need to go live in Production, so a pull request will be created to pull the current Develop branch into the Master branch.

Depending on how deploys are set up, production servers may just periodically pull code from the Master branch on Github, so it's imperative that everything be tested thoroughly in Develop before a deploy to Master.

For us, we probably don't need to create all these crazy branches. But what I do hope you learn to do is both 1) rebase your code and 2) be able to use the ```.gitignore``` file (next section).

Create a new repo on github.com, and clone it into a directory on your computer (we're not going to use this during the sprint, so it doesn't matter if there's nothing really in it).

If you haven't already, create a blank readme.md and commit it
```
touch readme.md
git add .
git commit -m 'added readme'
git push origin master
```
But wait, you say, where was the rebase??

I'm glad you asked.

Now let's create a feature branch
```
git checkout -b feature/cool_feature
```
Edit the readme file to say:
```
This is the file I'm creating as part of my cool feature.
```
Save and close the file. Add the changed file with ```git add``` and make a commit (call the commit something like 'initial commit for the cool feature'). Be sure to push to your branch:
```
git push origin feature/cool_feature
```

Let's say we change our minds and decide to go ahead and add some stuff to our repo...say a file structure.
```
mkdir cool_feature && cd cool_feature
touch cool_feature.txt
git add cool_feature/.
git commit -m 'added a folder and a file'
mv cool_feature.txt feature.txt
git rm cool_feature.txt
git add feature.txt
git commit -m 'renamed the text file'
git push origin feature/cool_feature
```
Okay, so now we have 3 commits in our cool feature branch. If we were to pull request this branch into Master, master's git history would look like (the hashes at the front are arbitrary and made up by me):
```
alj23 added readme
23lal initial commit for the cool feature
29zjf added a folder and a file
9z9d8 renamed the text file
```
as you can imagine, this could get very cluttered, very quickly. 

You can verify that your branch will have equally many commits by entering ```git log```, which should output something like
```
commit 0c4e4ddd081cbfcf31953184e711d5ba793121ed
Author: deanxorr <ddieker@gmail.com>
Date:   Wed Mar 13 16:38:25 2013 -0400

    renamed file

commit 8a86812b89f2d44cf025ded544ebe513d87c91e3
Author: deanxorr <ddieker@gmail.com>
Date:   Wed Mar 13 16:37:56 2013 -0400

    added directory

commit 9286090d284c987c8a434d1675c43656a3940f1a
Author: deanxorr <ddieker@gmail.com>
Date:   Wed Mar 13 16:37:19 2013 -0400

    initial commit for my cool feature

commit 9137421bcaecf4d2daf580966d9b44d8ab6841f9
Author: deanxorr <ddieker@gmail.com>
Date:   Wed Mar 13 16:36:39 2013 -0400

    initial with readme
```
Exit with control-c or :q. If neither of those work, google for 'exit from default text editor' with your OS and the terminal you are using (cygwin, mac osx terminal, etc.).

...it would be great if we could squash those commits down into one. This is where Rebase is super handy!!!

Make sure you're in the feature branch
```
git branch
```
should look like
```
  master
* feature/cool_feature
```
Now let's fetch the latest version of master
```
git fetch origin
```
If there had been changes to master, we would have seen this get updated. Now we have to update our local copy of master...
```
git checkout master
git pull origin master
git checkout feature/cool_feature
```
Okay, we could merge at this point by pulling in master, but that would probably create some headaches for us, and the order of our commits wouldn't be preserved, and we have all those random extra commit messages. So instead...

```
git rebase origin/master -i
```
The -i says 'we want to make some changes!'. Once you hit enter after the command above, you should be greeted with a text file that you can edit, much like the one below:
```
pick 9286090 initial commit for my cool feature
pick 8a86812 added directory
pick 0c4e4dd renamed file

# Rebase 9137421..0c4e4dd onto 9137421
#
# Commands:
#  p, pick = use commit
#  r, reword = use commit, but edit the commit message
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#  f, fixup = like "squash", but discard this commit's log message
#  x, exec = run command (the rest of the line) using shell
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

What we want to do is 'squash' the commits. We see that we can replace 'pick' with either 'squash' or 's'. However, in a rebase, the commit that is left on top must be left as 'pick', so your eventual file may look like this:
```
pick 9286090 initial commit for my cool feature
s 8a86812 added directory
s 0c4e4dd renamed file

# Rebase 9137421..0c4e4dd onto 9137421
#
# Commands:
#  p, pick = use commit
#  r, reword = use commit, but edit the commit message
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#  f, fixup = like "squash", but discard this commit's log message
#  x, exec = run command (the rest of the line) using shell
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```
Write the file (on mac, press <escape> to get out of input mode, type ':wq' to write and quit, and hit <return> to write the file and exit). You will be greeted with another screen:
```
# This is a combination of 3 commits.
# The first commit's message is:
initial commit for my cool feature

# This is the 2nd commit message:

added directory

# This is the 3rd commit message:

renamed file

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# Not currently on any branch.
# You are currently editing a commit during a rebase.
#
# Changes to be committed:
#   (use "git reset HEAD^1 <file>..." to unstage)
#
#       new file:   cool_feature/feature.txt
#       modified:   readme.md
#
```
Edit the file to delete all the text except for one line that describes the feature so that it looks something like:
```
branch for the coolest feature, ever.

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# Not currently on any branch.
# You are currently editing a commit during a rebase.
#
# Changes to be committed:
#   (use "git reset HEAD^1 <file>..." to unstage)
#
#       new file:   cool_feature/feature.txt
#       modified:   readme.md
#
```
Save this file, and git will rebase your code. If there are conflicts (there shouldn't be!) then git will stop the process, and you can type ```git status``` to see what files have conflicts in them. Make the files the way you would like them to look when you submit your pull request, then enter 
```
git add <filenames>...
git rebase --continue
```
When you are finished rebasing, push your rebased branch to github using the 'force' flag
```
git push origin feature/cool_feature -f
```
Then go to the github page for the repo, submit a pull request to Master, and marvel at how all your changes will be condensed to a single commit! Hooray!

#2. Using .gitignore#

The other super useful thing about git is the .gitignore file. This file tells git what files to skip over when it commits. We were just in Python, so I'll use the example of .pyc files.

.pyc files are compiled python files. They are saved so that the python compiler doesn't have to re-read your .py files each time; if the .pyc file is as recent as the .py file, python knows to just read the .pyc file instead.

However, this clutters up repositories (as some of you may have noticed in some of the Python sprints).

Open up the .gitignore file in the root directory of any of your apps. You may have to create it. The .gitignore is a magical file that tells git what files or extensions to ignore. Good candidates for this are log files, files with information specific to your local development environment (your laptop), etc. 

All we need to add to the .gitignore for it to not include every single .pyc file (which makes it hard to see the code that actually changed by cluttering up the pull request / Files Changed tab!) is add the line
```
# Ignore .pyc files
.pyc
```
The comment is for our benefit, so someone looking at your repository knows why that line is there. Other popular candidates include .DS_Store and other operating system or language specific files that are not directly related to the application. This way, when we use
```
git add .
``` 
any changes in these files will automatically be ignored.

Note that you will have to commit the .gitignore to the repository, and thus it will be shared and downloaded by any collaborators. Of course, you will know if anything changes in the .gitignore because you will review the pull request to your branch ;-)