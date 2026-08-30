 502  cd GFG
  503  cd gfg-devops-48-class/
  504  clear
  505  ls
  506  cd git-github-gfg/
  507  ls
  508  cd prac
  509  cd prac2
  510  ls
  511  git status
  512  cd ..
  513  clear
  514  ls
  515  cd prac2
  516  git init
  517  ls
  518  pwd
  519  touch a.py
  520  git add .
  521  git commit -m "first commit"
  522  git log
  523  git branch feature/123
  524  git branch
  525  git switch feature/123
  526  touch b.py
  527  cat > b.py
  528  git add .
  529  git commit -m "added b"
  530  git log
  531  touch c.txt
  532  git add c.txt
  533  git commit -m "added c.txt"
  534  git log
  535  git switch master
  536  git log
  537  git merge feature/123
  538  ls
  539  git log
  540  git branch feature/321
  541  git branch -d feature/123
  542  git switch feature/321
  543  ls
  544  touch d.txt
  545  git add d.txt
  546  git commit -m "added d.txt file from feature branch"
  547  git switch master
  548  git log
  549  touch l.txt
  550  git add l.txt
  551  git commit -m "added l.txt"
  552  git log
  553  git merge feature/321
  554  git log
  555  git branch bug/123
  556  git branch bug/321
  557  git switch bug/123
  558  touch eee.txt
  559  git add .
  560  git commit -m "file by bug/123"
  561  git log
  562  git log --oneline
  563  git checkout bug/321
  564  touch lklkl.txt
  565  git add lklkl.txt
  566  git commit -m "added by bug/321"
  567  git switch master
  568  git merge -s octopus bug/123 bug/321
  569  git log --oneline
  570  git branch
  571  git branch bug/story-123
  572  git switch bug/story-123
  573  cat > a.py
  574  git add a.py
  575  git commit -m "updated a.py"
  576  ls
  577  code .
  578  git log --oneline
  579  git switch master
  580  git log --oneline
  581  git merge --squash bug/story-123
  582  git status
  583  git commit -m "merged bug/story-123 branch by squashing it's commit"
  584  git log --oneline
  585  ls
  586  cat a.py
  587  git branch feature/story
  588  git switch feature/story
  589  ls
  590  vi a.py
  591  git add .
  592  git commit -m "added changes to a.py"
  593  git switch master
  594  touch gfg.txt
  595  git add gfg.txt
  596  git commit -m "master changes"
  597  vi b.py
  598  git add .
  599  git commit -m "updated b.py"
  600  git log --oneline
  601  git switch feature/story
  602  git log --oneline
  603  git cherry-pick 47538d
  604  ls
  605  git log --oneline
  606  git switch master
  607  git branch dev1
  608  git switch dev1
  609  ls
  610  vi a.py
  611  git add .
  612  git commit -m "added changed to a.py by dev1 branch"
  613  git switch master
  614  vi a.py
  615  git add a.py
  616  git commit -m "changes made on a.py by master"
  617  git log --oneline
  618  git switch dev1
  619  git log --oneline
  620  git switch master
  621  git merge dev1
  622  git mergetool
  623  git status
  624  cat a.py
  625  git commit -m "merged dev1 branch to master with some extra changes"
  626  git log --oneline
  627  cat app.py
  628  cat a.py
  629  ls
  630  cat a.py.orig
  631  rm -f a.py.orig
  632  git status
  633  cd ..
  634  mkdir prac3
  635  cd prac3
  636  git init
  637  ls
  638  touch a.py
  639  git add a.py
  640  git commit -m "first commit"
  641  git config user.email "sudhanshutest123@gmail.com"
  642  git config user.name "Trainersudhanshu"
  643  git config user.namee
  644  git config user.name
  645  git config user.email
  646  git branch dev1
  647  git switch dev1
  648  touch b.py
  649  git add b.py ; git commit -m "first commit by dev1"
  650  git switch master
  651  touch c.txt
  652  git add b.py ; git commit -m "second commit by master"
  653  git add c.py ; git commit -m "second commit by master"
  654  git add c.txt ; git commit -m "second commit by master"
  655  git log --oneline
  656  git switch dev1
  657  git log --oneline
  658  touch d.txt
  659  git add d.txt ; git commit -m "second commit by dev1"
  660  git switch master
  661  touch e.txt
  662  git add e.txt ; git commit -m "third commit by dev1"
  663  git log --oneline
  664  git switch dev1
  665  git log --oneline
  666  git merge master
  667  git log --oneline
  668  cd ..
  669  mkdir prac4
  670  cd prac4
  671  git init
  672  git config user.email "sudhanshutest123@gmail.com"
  673  git config user.name "Trainersudhanshu"
  674  touch a.py
  675  git add a.py
  676  git commit -m "first commit by master"
  677  git branch dev1
  678  git switch dev1
  679  touch b.txt ; git add . ; git commit -m "first commit by dev1"
  680  git switch master
  681  touch c.txt
  682  git add . ; git commit -m "second commit by master"
  683  git switch dev1
  684  touch d.txt ; git add . ; git commit -m "second commit by dev1"
  685  git switch master
  686  touch e.txt
  687  git add . ; git commit -m "third commit by master"
  688  git log --oneline
  689  git switch dev1
  690  git log --oneline
  691  touch hhh.txt
  692  git add . ; git commit -m "third commit by dev1"
  693  git log --oneline
  694  git rebase master
  695  ls
  696  git log --oneline
  697  git rebase -i HEAD~3
  698  git log --oneline
  699  git rebase -i HEAD~3
  700  git log --oneline
  701  git rebase -i HEAD~3
  702  ls
  703  touch gfg.txt
  704  cat > gfg.txt
  705  git status
  706  git add gfg.txt
  707  git commit --amend
  708  git rebase --continue
  709  git log --oneline
  710  git rebase -i HEAD~3
  711  git log --oneline
  712  ls
  713  cd ..
  714  mkdir prac4
  715  mkdir prac5
  716  cd prac5
  717  git init
  718  clear
  719  touch a.txt
  720  cat > a.txt
  721  git add a.txt
  722  git commit -m "first commit - base commit"
  723  git log --oneline
  724  vi a.txt
  725  touch b.txt
  726  vi b.txt
  727  git status
  728  git commit -m "second commit with more changes"
  729  git add a.txt
  730  git commit -m "second commit with more changes"
  731  git status
  732  git log --oneline
  733  git reset --soft HEAD~1
  734  git log --oneline
  735  cat a.txt
  736  git status
  737  git add b.txt
  738  git commit -m "second commit added the files"
  739  git log --oneline
  740  vi a.txt
  741  vi gfg.txt
  742  git status
  743  git add .
  744  git status
  745  git commit -m "third commit"
  746  git log --oneline
  747  git reset --mixed HEAD~1
  748  cat a.txt
  749  git status
  750  git add a.txt
  751  git status
  752  git commit -m "third commit with correct fix"
  753  git log --oneline
  754  git status
  755  vi gfg.txt
  756  git add gfg.txt
  757  touch c.csv
  758  git add .
  759  git commit -m "new commit"
  760  git log --oneline
  761  git reset --hard HEAD~1
  762  git log --oneline
  763  ls
  764  ls
  765  cd ..
  766  ls
  767  cd prac1
  768  ls
  769  git pull
  770  git switch master
  771  git pull
  772  cat a.py
  773  vi a.py
  774  git add .
  775  git commit -m "new data"
  776  git push
  777  git log --oneline
  778  git revert HEAD
  779  git log --oneline
  780  cat a.py
  781  git push
  782  cd ..
  783  ls
  784  cd prac1
  785  ls
  786  git branch dev1
  787  git branch dev2
  788  git switch dev1
  789  ls
  790  vi a.py
  791  git add a.py
  792  git status
  793  git switch dev2
  794  cat a.py
  795  git switch dev1
  796  git status
  797  git stash list
  798  git stash save "incomplete a.py change"
  799  git stash list
  800  git status
  801  cat a.py
  802  git switch dev2
  803  cat a.py
  804  vi a.py
  805  git add .
  806  git commit -m "updated"
  807  git switch dev1
  808  git stash list
  809  git stash apply stash@{0}
  810  git status
  811  cat a.py
  812  git stash list
  813  git stash drop stash@{0}
  814  git stash list
  815  cat a.py
  816  vi a.py
  817  git switch dev2
  818  cat a.py
  819  git stash save "a.py incomplete"
  820  git switch dev2
  821  cat a.py
  822  git switch dev1
  823  cat a.py
  824  git stash pop
  825  cat a.py
  826  git stash list
  827  vi a.py
  828  git add a.py
  829  git commit -m "a.py done"
  830  cd ..
  831  ls
  832  git clone https://github.com/sudhanshuvlog/GFG-Devops48.git
  833  git clone https://github.com/sudhanshuvlog/GFG-Devops48.git
  834  git clone https://github.com/sudhanshuvlog/GFG-Devops48.git
  835  cd prac1
  836  code .
  837  git diff HEAD~1 HEAD
  838  history
