[![Build Status](https://travis-ci.org/aadcg/.emacs.d.svg?branch=master)](https://travis-ci.org/aadcg/.emacs.d)


# How did I get here?

I assume you're motivated to use Emacs. If you're not, [convince yourself](https://www.youtube.com/watch?v=EsAkPl3On3E).


## Who am I?

An idiot who:

-   completed two bachelor's degrees in Physics and Mathematics (University of
    Porto, 2011-2017);
-   started a master's on Pure Maths (2017), but quitted after the first semester;
-   started to work for [Vestas](https://en.wikipedia.org/wiki/Vestas) and using Emacs in August 2018.

Back then, I barely knew what GNU/Linux was at all. My background was
theoretical so a piece a paper and a pen were my tools.

The point is: if Emacs is your cup of tea, you shall not struggle at all. I
still don't get those who tell that the learning curve is steep. Isn't the
profit curve even steeper? It's a matter of attitude and self motivation. I have
fun with Emacs everyday.

If you have never suffered while learning, I wonder if you have ever learnt
anything. The process starts with the traumatic experience of helplessness
towards new faculties that are yet to be acquired.


## The transition

I knew Ubuntu existed from a friend, but he was being driven by the convenience
of it. At that time, I didn't know free software, Richard Stallman or
GNU/Linux. It was when I stepped closer to these ethical issues that it
triggered my curiosity.

Once, while meeting a [professor](https://cmup.fc.up.pt/cmup/jalmeida/) in his office, I saw It for the first time. I
asked about It.

"It's Emacs! I write my \LaTeX papers, answer e-mails and write my programs
without ever leaving it!".

That seemed quite impressive, and I kept it in the back of my head. I was also
shifting from paper to computers. For instance, I took lecture notes using
[Lyx](https://en.wikipedia.org/wiki/Lyx) to generate \LaTeX docs. That was already quite impressive, since I
was making use of keybindings and other "wizardry" to suppress the repetitiveness
of certain things.

I scratched the surface of: "Being able to type accurately and fast on a
computer is convenient". What I didn't know is that my life would soon be so
deeply based on text, and the way [org mode](https://www.youtube.com/watch?v=SzA2YODtgK4) changes life.


# Where to start?

I recommend running Emacs on a GUI. He agrees and [expands](https://blog.aaronbieber.com/2016/12/29/don-t-use-terminal-emacs.html) on that.

Run it on GNU/Linux for obvious reasons. If circumstances make it impossible,
then run it on a virtual machine. He [expands](https://youtu.be/RDrG-_kapaQ) on that.

Emacs greets you!

*Welcome to GNU Emacs, one component of the GNU/Linux operating system.*

Get acquainted with what GNU stands for and read the tutorial (you might need to
read it more than once).


# Evolution


## Customization

I started working on my own init.el on December, 2018.

Following the trend, I went for a literate programming coupled with
[use-package](https://duckduckgo.com/l/?kh=-1&uddg=https%3A%2F%2Fgithub.com%2Fjwiegley%2Fuse%2Dpackage).

Vanilla Emacs (not customized) doesn't suck and you should learn it
well. The community is amazing and provides amazing packages. Try them out if
your needs require.


## Org agenda

Can't live without it. Words can't express the joy.


## E-mail

I still don't e-mail from within Emacs&#x2026; Damn it! I must fix it!


## Eww as a browser

The built-in Emacs browser, eww, will not replace Firefox. It doesn't run
Javascript. But you can use it for most of the things you need, with the added
benefit that you won't leave your text editor.


## Studying Emacs

Emacs is the self-documenting text editor, so C-h i has everything you need!


## Emacs Lisp

If you love Emacs, you'll start learning it before you notice.


## CI

I added CI (continuous integration) in June, 2019.


# Carrying org files

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
people who want the same you want - reliable tools, no bullshit added.

It is quite helpful if you get acquainted with [GNU](https://en.wikipedia.org/wiki/GNU_Project), [Free Software Foundation
(FSF)](https://en.wikipedia.org/wiki/Free_Software_Foundation) and [Richard Stallman](https://www.youtube.com/watch?v=jUibaPTXSHk).

I wish the world talked Richard Stallman and Linus Torvalds in a balanced
proportion.

I wish students weren't being taught proprietary software.

I wish companies and their engineers to have ethics.

The road to freedom is hard. I'm consciously and proactively fighting years of
bad education.

**Free thought, free world.**


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> Write me if something doesn't work for you.
