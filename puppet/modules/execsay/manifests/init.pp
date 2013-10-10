class execsay {
  # or run multiple commands - all must succeed for exec to run
  exec { "run_say_hello":
    command => "/bin/echo", #/usr/local/sbin/account_purger",
    onlyif => [
    "grep -c root /etc/passwd",    # nix-tip; grep -c count #times   , ie old_account
    "test -d /home/vagrant/"          #nix-tip; test -d fn ; chk if fn is a folder directory  , ie old_account
    # MUST test the retcode, always nil output
    # root on vagrant is called 'vagrant'
    # nix-tip; Syntactic sugar for "test" evaluation function is double square brackets [[ ! echo 0 ]]
    # puppet-tip; NB these are NOT nix commands here, syntax and capture of retcode is PUPPET
    ]
  }

/*
nix-tip; if/else/fi ; to use on one line, put semicolon after each full clause, ie if; then; else; fi
nix-tip; to test item is  folder use the double square bracket testing features with -d for folder: if [[ -d fn ]];

  vagrant@precise64:~$ if [[ -d /home/root22/ ]]; then     echo yes; else   echo no; fi
no
vagrant@precise64:~$ if [[ -d /home/root/ ]]; then     echo yes; else   echo no; fi
no
vagrant@precise64:~$ sudo ls /home/
vagrant
vagrant@precise64:~$ if [[ -d /home/vagrant/ ]]; then     echo yes; else   echo no; fi
yes
vagrant@precise64:~$


http://stackoverflow.com/questions/59838/how-to-check-if-a-directory-exists-in-a-shell-script
To check if a directory exists in a shell script you can use the following:

if [ -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY exists.
fi

Or to check if a directory doesn't exist:

if [ ! -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
fi

However, as Jon Ericson points out (thanks Jon), subsequent commands may not work as intended if you do not take into account that a symbolic link to a directory will also pass this check. E.g. running this:

ln -s "$ACTUAL_DIR" "$SYMLINK"
if [ -d "$SYMLINK" ]; then
  rmdir "$SYMLINK"
fi

Will produce the error message:

rmdir: failed to remove `symlink': Not a directory

So symbolic links may have to be treated differently, if subsequent commands expect directories:

if [ -d "$LINK_OR_DIR" ]; then
  if [ -L "$LINK_OR_DIR" ]; then
    # It is a symlink!
    # Symbolic link specific commands go here.
    rm "$LINK_OR_DIR"
  else
    # It's a directory!
    # Directory command goes here.
    rmdir "$LINK_OR_DIR"
  fi
fi

Take particular note of the double-quotes used to wrap the variables, the reason for this is explained by 8jean in another answer.

If the variables contain spaces or other unusual characters it will probably cause the script to fail.
share|edit|flag

edited Apr 10 at 8:36
Steven Penny
13.4k72872

answered Sep 12 '08 at 20:07
Grundlefleck
21.7k124674

8


If you want to play it safe with the GNU tools, use of -- is highly recommended (end-of-options marker). Otherwise, if your variable contains something that looks like an option, the script'll fail just as with spaces. –  Marc Mutz - mmutz Jul 21 '09 at 16:36
105


It might be worth mentioning that [ ... ] is syntactic sugar for the 'test' command. Useful information because without it you might not know you can do 'man test' to get the documentation.

***/

}