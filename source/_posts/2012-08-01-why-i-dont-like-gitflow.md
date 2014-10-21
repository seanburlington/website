---
layout: post
title: Why I don't like gitflow
created: 1343826159
categories:
- git
- version control
- gitflow
---
<p>
I've been looking into <a href="https://github.com/nvie/gitflow/">gitflow</a> recently, it's an interesting set of scripts to facilitate <a href="http://nvie.com/posts/a-successful-git-branching-model/">a succesful git branching model</a> which some of the people I work with rave about.
</p>
<p>
In the end I've decided I don't like the tool or the model, though both are interesting.
</p>
<p>
I think this is because I'm used to working in fairly large teams where we may have some people working on one release and others working on the next, in this situation I want release branches that are fairly long lived, and to create topic branches from them.
</p>
<p>
In fact in one project we dropped the master branch altogether and just used a series or release barnches, always merging the older release branches into the newer (further from launch) ones. 
</p>
<p>
The other main reason is that gitflow hides some of the mechanics of git in a way that seems to me to hinder peoples understanding of what they are doing, it's a shame it down't output the git commands it uses - that would allow people to use it to get started then move on later if they want.
</p>
<p>
The commands also seem very slow to me which is odd when you are used to git being fast.
</p>
<p>
Documentation on gitflow seems sparse, with some commands incomplete (git flow support * , gitflow feature checkout)
</p>
<p>
 The best I could find is the source, and particularly the &quot;summary&quot; bits
</p>
<p>
 <a href="https://github.com/nvie/gitflow/blob/develop/git-flow-release#L177">https://github.com/nvie/gitflow/blob/develop/git-flow-release#L177</a>
</p>
<p>
The project wiki does have some addiutional info on command line options 
</p>
<p>
 <a href="https://github.com/nvie/gitflow/wiki/Command-Line-Arguments">https://github.com/nvie/gitflow/wiki/Command-Line-Arguments</a>
</p>
<p>
&nbsp;
</p>
<p>
&nbsp;
</p>
