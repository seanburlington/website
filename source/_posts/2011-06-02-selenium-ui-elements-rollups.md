---
layout: post
title: Selenium UI-Elements Rollups
created: 1307031756
comments: true
categories:
- testing
- selenium
- dry
---
I wasn't 100% clear from the docs how to implement rollup rules in selenium ui-elements and searching the web didn't return much - so here's an example in case it's helpful to others.

Add this to the user-extensions.js file

<code>
var manager = new RollupManager();

manager.addRollupRule({
    name: 'compare_product'
    , description: 'gets to the reults on a compare product page'
    , args: [
        {
          name: 'term'
        , description: 'the aliased term name of the category'
        }
        , {
            name: 'provider'
          , description: 'the provider name'
          }
        , {
            name: 'product'
          , description: 'the product name'
          }
    ]
    , commandMatchers: [
        {
            command: 'click.+'
            , target: 'starRatingsCompareProduct::search_go\\(.+'
        }
    ]
    , getExpandedCommands: function(args) {
        var commands = [];
             
        commands.push({
            command: 'open'
                , target: '/star-ratings/find-star-ratings/'+args.term
        });
        
        commands.push({
            command: 'selectAndWait'
                , target: 'edit-provider'
        , value: args.provider
        });
    
        commands.push({
              command: 'pause'
            , target: '1000'
        });
        commands.push({
              command: 'selectAndWait'
            , target: 'edit-product'
            , value: args.product
        });
        commands.push({
              command: 'waitForElementPresent'
            , target: 'star-ratings-badge'
        });
        commands.push({
              command: 'clickAndWait'
            , target: 'edit-same-rating'
        });
        commands.push({
              command: 'waitForTextPresent'
            , target: 'Products with the same Star Rating'
        });
        return commands;
    }
});

</code>

Then you can use it in selenium as below

<code>
<tr>
	<td>rollup</td>
	<td>compare_product</td>
	<td>term=buy-let-insurance, provider=Cactus Cover, product=Residential Let</td>
</tr>

</code>

This avoids me repeating chunks of code that I would otherwise need to get the page to the point at which I want to test it. 

NB I've kind of ignored the commandmatcher bit for the time being (this is a nicety to help the IDE notice a rollup while recording - it's a required field - but doesn't have to be useful).


<b>This blog post sponsored by www.defaqto.com (they like their team to give back to the community)</b>
