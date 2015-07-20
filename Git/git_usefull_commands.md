		COMMANDS 	: 	 DISCRIPTION
1. git clone < SSH URL >	: This command is used to clone the git remote repository. The sshurl is the secure url provided by git. The Clone operation creates an instance of the remote repository

2. git init 			: after making the directory localy we have to initialize before connecting to the remote origin. This Command create the .git directory which contains the configuration files. It contains the " branches, config, HEAD, index, logs, packed-refs, COMMIT_EDITMSG, description, hooks, info, objects, refs" files and folders.

3. git remote add origin <ssh url >	: By this command we connect to the remote origin with the ssh url.

	
4. git add <filename> 		: This commands adds the file to the repository. This command can be used with . instead of filename. This . represent the all modification made by the author. 


5. git status 			: This command shows the status of tracked and untracked files.

6. git commit -m"<proper comment>" : this command is used to add the proper message of modification 

7. git log 			: this command provides the logs of the commit made by the author.

8. git diff			: this command shows the difference between the modified file and prevous files

9. git checkout -b <branchname> : this creates the new branch and check out to the new branch.

10. git branch 			: this also creats the new branch.

11. git pull origin <branchname>: this command pulls the branchname to the local repository.


