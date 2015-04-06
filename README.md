Hugo
====

This is a version of GitHub's Campfire bot, [hubot](https://github.com/github/hubot).
He's pretty cool.
If you have general questions about Hubot, refer to its [docs](https://github.com/github/hubot/blob/master/docs/README.md).

This repo is just for Hugo.
Hugo is a nickname for this collection of scripts, which we find to be useful or entertaining.

Hugo prefers IRC.


Variables
---------

Hugo needs a bunch of variables in order to function.
Set these environment variables before running Hugo to make him happy.

``FILE_BRAIN_PATH``
: The place to store Hugo's brain. [File Brain](https://github.com/github/hubot-scripts/blob/master/src/scripts/file-brain.coffee)

``HUBOT_IRC_SERVER``
: The IRC server to connect to. [IRC Adapter docs](irc-docs)

``HUBOT_IRC_ROOMS``
: The IRC rooms that Hugo should join. [IRC Adapter docs](irc-docs)

``HUBOT_IRC_NICK``
: The IRC nickname that Hugo should use. [IRC Adapter docs](irc-docs)


[irc-docs]: https://github.com/nandub/hubot-irc#configuring-the-adapter


Running Hugo
------------

If you want him to connect to an IRC server, you have to tell him to use the IRC adapter.

~~~

bin/hubot -a irc --name hugo

~~~

If you want to run him in a shell (for debuggin'), leave off the adapter flag.
As noted below, set the ``FILE_BRAIN_PATH`` variable equal to ``.`` to store the brain file locally.

~~~

FILE_BRAIN_PATH=. bin/hubot --name hugo

~~~

**Note**:
Either way, you'll probably have to set the ``FILE_BRAIN_PATH`` environment variable.
Otherwise, Hugo's going to try to store his brain in ``/var`` somewhere, and he probably won't have write permissions, and he will cry many, many tears.
Sad robot tears.
