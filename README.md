[\![Build Status](<https://travis-ci.org/aadcg/.emacs.d.svg?branch=master>)](<https://travis-ci.org/aadcg/.emacs.d>)


# How did I get to Emacs?


## Who am I?

I assume you're motivated to use Emacs. If you're not - [convince yourself](https://www.youtube.com/watch?v=EsAkPl3On3E).

I completed two bachelor's degrees from the University of Porto between 2011 and
2017; started a master's program on pure maths, but quitted after the first
semester. Then started to work for [Vestas](https://en.wikipedia.org/wiki/Vestas) and using Emacs, in August 2018. Back
then, I barely knew what GNU/Linux was at all. My background was all about
proofs using pencils or chalk on paper or blackboards. The point is: anyone can
use Emacs, and it's not difficult to get into it.


## How did the shift happen?

A friend of mine was using Ubuntu. Once I met a [professor](https://cmup.fc.up.pt/cmup/jalmeida/) in his office, and he
was using a "strange program". I asked about it, and he replied - "It's Emacs! I
write all my \LaTeX papers here, answer e-mails and write my programs without
leaving it!". That seemed quite impressive and I kept it in the back of my
head. At that time, I was also starting to shift from paper to computers, since
I was taking lecture notes using [Lyx](https://en.wikipedia.org/wiki/Lyx) to generate \LaTeX docs. I thought it
couldn't get better than that. Seeing my colleagues typing every \LaTeX command
from scratch made me feel sorry for them.

At that time I only scratched the surface of the following idea: "Being able to
type accurately and fast on a computer is convenient". What I didn't know
is that my life would soon be so deeply based on text. Namely, because [org mode](https://www.youtube.com/watch?v=SzA2YODtgK4)
is such a whole new universe.


# Where to start?

I recommend running Emacs on a GUI. This guy agrees and [expands](https://blog.aaronbieber.com/2016/12/29/don-t-use-terminal-emacs.html) on that.

I also recommend running it on GNU/Linux for obvious reasons. If your company
makes you use that Windows laptop, then run it on a virtual machine. This guy
[expands](https://youtu.be/RDrG-_kapaQ) on that.

Then it's time to open Emacs. It greets you with:

*Welcome to GNU Emacs, one component of the GNU/Linux operating system.*

Get acquainted with what GNU stands for and read the tutorial.


# Evolution


## Customization

I started working on my own init.el roughly on December, 2018.

Following the trend, I went for a literate programming kind of approach coupled
with [use-package](https://duckduckgo.com/l/?kh=-1&uddg=https%3A%2F%2Fgithub.com%2Fjwiegley%2Fuse%2Dpackage). I disagree with those who say that vanilla Emacs (not
customized) sucks. I see some packages as interesting add-ons. Others seem just
useless since they could be easily replaced by built-in Emacs functionality.
If only those people dared to read and study the manual.


### Org agenda


### E-mail


### Browsing the web


## Emacs Lisp

Anyway, I guess they're just having fun learning Emacs lisp. Which brings me to
the next stage of using Emacs. When you start to work on your init.el you mostly
copy from other people. Then you understand that it's actually useful to know
Emacs Lisp (and Lisps in general too). That's the stage I'm currently at.


# How do I carry my org files?

I have a smartphone, one of those Android. I mitigated the Google influence by
not adding a Google account or not running Google apps. Anyway, I'm sure I'm
running endless malware in it. I'd like to get one of [these](https://puri.sm/products/librem-5/), one day.

So, my "App-store" is [F-Droid](https://f-droid.org/). In there you'll find [Termux](https://termux.com/). That coupled with
[Nextcloud](https://nextcloud.com/) makes it possible me to access my org files and agenda anywhere,
anytime and to sync effortlessly. My life in plain text.


## Tutorial<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup>

-   [Install Termux](https://f-droid.org/packages/com.termux/)
-   Install Nextcloud (available on F-Droid)
-   Download the needed .org files from Nextcloud to your device
-   Run the following commands
    -   pkg install emacs, git
    -   [termux-setup-storage](https://wiki.termux.com/wiki/Sharing_Data) (to create symlinks)
-   A symlink might be needed depending on the way you set org-agenda-files and on
    where the Nextcloud files are located


# Sidenote on GNU

Emacs is all about freedom. When you work in it, you feel it was designed by
people who want the same you want - something reliable without bullshit.

It is quite helpful if you get acquainted with [GNU](https://en.wikipedia.org/wiki/GNU_Project), [Free Software Foundation
(FSF)](https://en.wikipedia.org/wiki/Free_Software_Foundation) and [Richard Stallman](https://www.youtube.com/watch?v=jUibaPTXSHk). I wish the world talked Richard Stallman and Linus
Torvalds in a balanced proportion. I wish students weren't being taught
proprietary software. I wish companies and their engineers to have ethics.

The road to freedom is hard. I'm consciously and proactively fighting years of
bad education.

**Free thought, free world.**


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Write me if something doesn't work for you.
