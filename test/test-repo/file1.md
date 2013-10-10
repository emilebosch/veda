---
title: "How to: LXC from scratch"
author: emile
date: 2013-09-29
---

Here we create a plain LXC & AUFS container from scratch on Ubuntu Raring without Docker.

<!-- break -->

### Overview

The objective of this exercise is to make you familiar how you can create a docker'esque LXC container yourself. This is how we'll do it:

- Create a filesystem we can use as write disk so our container can write, but it won't pollute our base filesystem.
- Combine the root filesystem with our container so we have an unified filesystem for our container.
- Create a container and run /bin/bash

### Creating the writable file system

For a lot of this we need to be sudo. So lets go for it:

```
sudo -i
```

We want to mount our parent filesystem read-only, and put all changes on top of this made in the container into
a specific file called ``mycontainerrw.img``.

Let's start by creating a mountable filessystem for our writes, this will create a 500mb empty image. The ``fs`` parameters
is the filestream, the ``bs`` the block size, the ``count`` number of blocks:

```
dd if=/dev/zero of=mycontainerrw.img bs=1M count=500
```

The command above basically creates a zero padded file of 500MB.
Now we need to run `mkfs` on the file to make a filesystem out of this zero padded file:

```
mkfs mycontainerrw.img
```

Let's create a mountpoint for it. It will nag that this is no block device. Whatever.

```
sudo mkdir /mnt/mycontainerrw
sudo mount -t mycontainerrw.img /mnt/mycontainerrw
```

Now lets create our container fs combing the rw and the ro images using AUFS. You can see we mount ``/`` as ``ro`` (read-only) and ``/dev/mycontainerrw`` as `rw` (read-write). This
will mean that whenever we write to our ``/dev/mycontainer-fs`` we actually write to our ``mycontainerrw.img``, leaving the root filesystem untouched. Amazeballs.


```
sudo mount -t aufs -o br=/dev/mycontainerrw=rw:/=ro -o udba=reval none /dev/mycontainer-fs
```

After we've created this, we can start creating our LXC container.

##### Setting up our LXC container

```
sudo lxc-create -n mycontainer
```

It will be created in the directory ``/var/lib/lxc/mycontainer`` so lets go there.

```
cd /var/lib/lxc/mycontainer
```

Let's edit the config so we can mount our new made mycontainer-fs :) Remember. ``man lxc.conf`` to see what config options are available.

Here you can see we mount our unified mycontainer-fs in the ``config`` file.

```
lxc.network.type = veth
lxc.network.link = lxcbr0
lxc.network.flags = up

lxc.rootfs = /dev/mycontainer-fs
```
To start our container we do:

```
sudo lxc-execute -n mycontainer /bin/bash
```

Congratulations! You are now in a container, with AUFS. Every change you do now will be written to our ``mycontainerrw.img`` :-)

You can see that you can't see what you typed. Not a clue why, I'll will figure that out.
To get out of your container do the following:

```
exit
```

This will say:

```
[1]+  Stopped sudo lxc-execute -n mycontainer /bin/bash
```

and then type:

```
fg
```

Your container should now be terminated.


##### Conclusion

As you can see it ain't that hard to create a container with AUFS and LXC. It's not hard to build something like a couple
of shell scripts that allow for automation of this process like docker.
