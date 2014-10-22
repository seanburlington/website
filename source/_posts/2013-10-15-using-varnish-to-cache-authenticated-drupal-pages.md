---
layout: post
title: Using varnish to cache authenticated Drupal pages
created: 1381867342
categories:
- drupal
- varnish
- esi
- caching
---
I have a site which requires users to be logged in, but the pages are not customised. I was playing with a way to cache the content in varnish while still doing an access check. This method uses an access check pages (test.php below) which then uses ESI to load the real, cacheable content.

I've tried it in a dev env, I'm not yet sure if we'll use this in production.

Varnish config

```C
probe checkslash {
    .url = "/robots.txt";
    .interval = 500s;
    .timeout = 10s;
}    
        
include "backends.vcl";
    
/** generic config from here down */
sub vcl_recv{
   
  /* if the drupals are down, this is how long we cache for */
  set req.grace = 6h;
    
  /* Make sure we direct 443 traffic to the secure drupal */
  if (server.port == 443 ) {
    set req.backend = drpau_ssl_director; 
  } else {
    /* port 80 traffic goes to the correct LB */
    set req.backend = drpau_director;
  }
  # just pass through non-page files, and the login page
  if (req.url ~ "(?i)\.(pdf|asc|dat|txt|doc|xls|ppt|tgz|csv|png|gif|jpeg|jpg|ico|swf|css|js|htc|ejs)(\?.*)?$") {
  } else if (req.url ~ "(?i)(sites/default/files)|(js/)|(/login)" ) { 
  } else if (req.esi_level == 0 ) {
    # pass regular pages to a spoecial url
    set req.url = "/esi" + req.url;
  }
  return (lookup);
}
    
    
    
sub vcl_fetch {
    
  if (req.url ~ "/esi/" && req.esi_level == 0 ) {
    set beresp.do_esi = true; /* Do ESI processing               */ 
   }
      
}

```

Then in apache I redirect all requests for pages that come via the esi prefix 


```ApacheConf
RewriteRule ^esi/(.*)$ test.php [L]
```


and test php is



```PHP
    define('DRUPAL_ROOT', getcwd());
    // We prepare only a minimal bootstrap.
    require_once DRUPAL_ROOT . '/includes/bootstrap.inc';
    drupal_bootstrap(DRUPAL_BOOTSTRAP_SESSION);
    global $user;
    $roles = user_roles();
             
    if (in_array('anonymous user', $user->roles)) {
      $uri = preg_replace('#^/esi#', '', $_SERVER[REQUEST_URI]);
      echo "<esi:include src=\"http://$_SERVER[SERVER_NAME]$uri\"/>";
    } else {
     	header("Location: https://$_SERVER[SERVER_NAME]/login");
    }

```


  
