---
layout: post
title: "Import data to Graphite from Munin"
date: 2014-11-28 18:26:44 +0000
comments: true
categories: 
- graphite
- munin
- logging
- munin
- rrd
- whisper
---

To convert data from munin/rrd to graphite/whisper you need to use the `rrdwhisper` tool which in centos is part of the python-whisper package.

If you want to change the data retention/resolution properties in graphite you will also need to resize the files as well.

Note that Graphites reads from /etc/carbon/storage-aggregation.conf and /etc/carbon/storage-schemas.conf to select the retention and aggregation policies for *new* data, but since these are set in the file at creation time editing the config file has no effect on existing files (or those created with whisper2rrd).

Recent data is stored at 10 second intervals, when it becomes older 6 lots of 10 second data get aggregated to make a one minute interval. I think this aggregation also happens on newer data if I select say data for the last 2 days since this time period include data at the lower resolution - all the data I get is at this lower resolution.

When this data is aggregated it can be averaged; in my case I'm measuring how long something takes - and average is right. But say I was counting something then I'd want to know the total over a minute - sum - not average, and if I was recording peaks then I'd want the max.

The xFilesFactor as I understand it tells graphite to ignore all the data for an interval if there are too many nulls, but since my original data is at a lower resolution I have loads of nulls and don't want to ignore anything - so I'm setting this to zero and my import seems to work well at different scales and on both old and new data.


```bash

for rrd in *rrd ; do 
    rrd2whisper --xFilesFactor=0.0 --aggregationMethod=average $rrd
    whisper-resize  --xFilesFactor=0.0 --aggregationMethod=average --nobackup ${rrd%.rrd}_42.wsp   10s:6h 1min:6d 10min:1800d  
done


[ -d /var/lib/carbon/whisper/munin ] || sudo -u carbon mkdir -p /var/lib/carbon/whisper/munin
sudo mv *wsp /var/lib/carbon/whisper/munin
sudo chown -R carbon:carbon  /var/lib/carbon/whisper/munin

```

This script excerpt deals with the basic conversion - I also needed to convert the long filenames munin used to a nested directory structure used by graphite.

That conversion will depend on your use case - if you look at the files stored under /var/lib/carbon/whisper and /var/lib/munin you should be able to see the pattern.
