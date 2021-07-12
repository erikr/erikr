---
layout: post
title: Set up Jupyter notebook on a remote server
---

## Intro

## 1. Password setup

Log in to the remote server:

```zsh
> jupyter notebook password
Enter password:  ****
Verify password: ****
[NotebookPasswordApp] Wrote hashed password to /Users/you/.jupyter/jupyter_notebook_config.json
```

## 2. Add aliases to your `~/.aliases` (or equivalent dotfile)

```
remote_user="your_name"
remote_machine="server_address"
PORT=1234

alias remote_notebook_start='ssh -f ${remote_user}@${remote_machine} ". ~/.zshrc; jupyter-lab --no-browser --port=${PORT}"'

alias remote_notebook_stop='ssh ${remote_user}@${remote_machine} "pkill -u ${remote_user} jupyter"'

alias port_forward='ssh -N -f -L localhost:${PORT}:localhost:${PORT} ${remote_user}@${remote_machine}; open http://localhost:${PORT} &'
```

My `.aliases` dotfile is in my [dotfiles repo](https://github.com/erikr/dotfiles/blob/master/.aliases).

> Note: non-interactive SSH login does not source your dotfiles, so the path to your Jupyter installation is not set. To address, need to source `.zshrc` (or whichever dotfile you use to set your paths).

## 3. Source your `~/.aliases` so you can use the aliases
```zsh
source ~/.aliases
```

## 4. Start JupyterLab on the remote server from your local machine

```zsh
> remote_notebook_start
> [I 08:46:27.397 LabApp] JupyterLab extension loaded from /home/aguirrelab/anaconda3/envs/py37/lib/python3.7/site-packages/jupyterlab
[I 08:46:27.397 LabApp] JupyterLab application directory is /home/aguirrelab/anaconda3/envs/py37/share/jupyter/lab
[I 08:46:27.398 LabApp] Serving notebooks from local directory: /home/erik
[I 08:46:27.398 LabApp] The Jupyter Notebook is running at:
[I 08:46:27.398 LabApp] http://localhost:3745/?token=0bdce76aeced2496912c4af62633715ba7c771c31e82f877
[I 08:46:27.398 LabApp]  or http://127.0.0.1:3745/?token=0bdce76aeced2496912c4af62633715ba7c771c31e82f877
[I 08:46:27.398 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 08:46:27.401 LabApp]

    To access the notebook, open this file in a browser:
        file:///home/erik/.local/share/jupyter/runtime/nbserver-9802-open.html
    Or copy and paste one of these URLs:
        http://localhost:3745/?token=0bdce76aced2496912c4af626715ba7c771c31e82f877
     or http://127.0.0.1:3745/?token=0bdce76aced2496912c4af626715ba7c771c31e82f877
```

Hit "return" after you see above output to return to your console.

## 5. Forward port and open notebook from your local machine
```zsh
> port_forward
bind [127.0.0.1]:3745: Address already in use
channel_setup_fwd_listener_tcpip: cannot listen to port: 3745
Could not request local forwarding.
[1] 48429
[1]  + 48429 done       open http://localhost:${PORT}
$ [I 12:58:28.234 LabApp] 302 GET / (127.0.0.1) 1.15ms     dotfiles -> master
[W 12:58:29.073 LabApp] Could not determine jupyterlab build status without nodejs
```

The `port_forward` alias opens your default browser and navigates to the notebook:

![](/assets/jupyter-screenshot.png)


## 6. Stop JupyterLab on the remote server from your local machine

```zsh
> remote_notebook_stop
> [I 12:57:27.298 LabApp] JupyterLab extension loaded from /home/er498/anaconda3/envs/py37/lib/python3.7/site-packages/jupyterlab
[I 12:57:27.298 LabApp] JupyterLab application directory is /home/er498/anaconda3/envs/py37/share/jupyter/lab
[I 12:57:27.299 LabApp] Serving notebooks from local directory: /home/er498
[I 12:57:27.299 LabApp] The Jupyter Notebook is running at:
[I 12:57:27.299 LabApp] http://localhost:3745/
[I 12:57:27.299 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
```
