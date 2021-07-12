---
layout: post
title: Calling Python 3 in Matlab 
tags:
---

Here I describe three steps to enable calling Python 3 in Matlab:

1. Update Matlab path to system path.
2. Automate path addition to run every time Matlab starts.
3. Update default version of Python interpreter in Matlab.

> `>>` is the Matlab environment, `$` is the Bash shell, and `>>>` is the Python environment.

### 1. Update Matlab path to system path

Make a system call to python from within the Matlab IDE:

```
>> !python
Python 2.7.10 (default, Oct 23 2015, 19:19:21) 
[GCC 4.2.1 Compatible Apple LLVM 7.0.0 (clang-700.0.59.5)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
```

As expected, macOS defaults `python` calls to Python 2; Python 3 must be explicitly called:

```
>> !python3
/bin/Bash: python3: command not found
```

Uh oh! Matlab does not source your Bash shell resource file. Even though my Bash shell can handle a call to `python3`, Matlab cannot.

In Matlab, my system PATH is:

```
>> unix('echo $PATH')
/usr/bin:/bin:/usr/sbin:/sbin
```

In Bash, my system PATH is different:

```
$ echo $PATH
/Users/erik/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/erik/.rvm/bin
```

We need to update Matlab's PATH using `setenv`.

First, I grab my system PATH onto the clipboard so I can paste it later:

```
$ echo $PATH | pbcopy
```

Next, in Matlab I call `setenv` and copy my system PATH into the second argument:

```
>> setenv('PATH', '/Users/erik/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/erik/.rvm/bin')
```

Now system calls to `python3` work from within Matlab:

```
>> !python3
Python 3.5.2 (default, Jul 28 2016, 21:28:00) 
[GCC 4.2.1 Compatible Apple LLVM 7.3.0 (clang-703.0.31)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
```

However, this situation only lasts for the current Matlab instance.

### 2. Automate path addition to run every time Matlab starts

To make the addition of the correct path effectively permament, you can add the above code to a `startup.m` file [(read more about this here)](http://www.mathworks.com/help/matlab/ref/startup.html). Store it anywhere in the Matlab search path. The script runs every time Matlab is started.

Here are the relevant contents of  my `startup.m`:

```
% Add my GitHub repos to search path
addpath(genpath('~/repos'));

% Set OS path for this shell instance
setenv('PATH', '/Users/erik/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/erik/.rvm/bin');
```

Ideally Matlab would automatically import the system PATH, but unfortunately it does not.

### 3. Update default version of Python interpreter in Matlab

Finally, if you want to call Python modules within Matlab, you need to change the default version of the Python interpreter.

If you check the version loaded in Matlab, you probably see the macOS default version and executable path to that version:

```
>> pyversion

       version: '2.7'
    executable: '/usr/bin/python'
       library: '/System/Library/Frameworks/Python.framework/Versions/2.7/lib/libpython2.7.d…'
          home: '/System/Library/Frameworks/Python.framework/Versions/2.7'
      isloaded: 0
```

Run Python 3 from Bash and find the path to the executable. If you installed Python 3 using Homebrew, your path probably looks like this:

```
>>> import sys
>>> print(sys.executable)
/usr/local/opt/python3/bin/python3.6
```

Run Matlab and use the path as the argument for `pyversion`:

```
>> pyversion('/usr/local/opt/python3/bin/python3.6');
```

Check that your setting of the new executable path worked by calling `pyversion` with no arguments:

```
>> pyversion

       version: '3.6'
    executable: '/usr/local/opt/python3/bin/python3.6'
       library: '/usr/local/Cellar/python3/3.6.0/Frameworks/Python.framework/Versions/3.6/li…'
          home: '/usr/local/Cellar/python3/3.6.0/Frameworks/Python.framework/Versions/3.6'
      isloaded: 0
```

Now you have Python 3 goodness within Matlab.
