# Horizn

###### A landscape focused strategy for blogging. 

Horizn's focus is to make the web's digital publication format more paletable to users of all device sizes. Showing your visitors what they need to see, when they need to see it, regardless of what kind of device they are on, or what orientation they are holding it in. Horizn is the default layout for [GHK](https://github.com/rjminchuk/ghk).

###### Features, State, and Technical Deatils

Horizn is less of a framework, and more of a strategy for handling different device types. Since Horizn was developed with blogging in mind, it can represent two states, a visitor reading an article, or not reading an article. The underlying style system relies heavily on a hidden checkbox to determine the view the user will get back. This provides two states, checked: article open, and unchecked: article closed (For static pages, the checkbox can be defaulted to either state) Horizn has no dependencies on JavaScript, and future itterations of Horizn will not require JS. Any additional JS features will be a la carte.

###### The Moving Parts

- `#horizn-article-open` | The checkbox input controlling article state
- `.horizn-container` | A container required for css grid
- `.horizn-leadin` | A nice place for an author photo, the name of your blog, and maybe a link to your github
- `.horizn-timeline` | The area for your blog feed
- `.horizn-sheet` | The area your blog article goes

###### But what shows and when?

That's a realy good question. What shows is only the most important content for the scale and orientation of your device. There are 5 different scenarios covering 12 posibile device sizes, orientations, and states.

|                    | *ARTICLE OPEN*                                     | *ARTICLE CLOSED*                         |
|:------------------ |:-------------------------------------------------- |:---------------------------------------- |
| **LANDSCAPE**      |                                                    |                                          |
| Handheld / Mobile  | 2 col(s): leadin over timeline next to the Article | 2 col(s): leadin next to timeline        |
| Medium / Tablet    | 2 col(s): leadin over timeline next to the Article | 2 col(s): leadin next to timeline        |
| Large / Desktop    | 3 col(s): leadin, timeline, then Article           | 2 col(s): leadin next to timeline        |
| **PORTRAIT**       |                                                    |                                          |
| Handheld / Mobile  | 1 col(s): Article only                             | 1 col(s): colapsed, leadin over timeline |
| Medium / Tablet    | 2 col(s): leadin over timeline next to the Article | 2 col(s): leadin next to timeline        |
| Large / Pro tablet | 2 col(s): leadin over timeline next to the Article | 2 col(s): leadin next to timeline        |

###### A working example

[richminchuk.io](http://richminchuk.io) is the dev site for my personal bloging utility, [GHK](https://github.com/rjminchuk/ghk).

###### The minimum layout 

```html
<!DOCTYPE html>
<html>
   <head>
      <link rel="stylesheet" href="/css/horizn.css">
   </head>
   <body>
      <input type="checkbox" id="horizn-article-open">
      <div class="horizn-container">
         <div class='horizn-leadin'>
            <!-- <h1>site name</h1> -->
         </div>
         <div class='horizn-timeline'>
            <!-- <label for="horizn-article-open"><h3>2017.12.15</h3></label>
                 <p>Unit Testing on MacOS /&nbsp;Windows</p>
                 <label for="horizn-article-open"><h3>2017.04.09</h3></label>
                 <p>Creating a dotnet core NuGet&nbsp;Package</p> -->
         </div>
         <div class='horizn-sheet'>
            <!-- <p><label for="horizn-article-open">close</label></p>
                 <h2>Article Title</h2>
                 <p>Article body.</p> -->
         </div>
      </div>
   </body>
</html>
```

###### When should I not use Horizn?

Horizn uses CSS Grid, making it a bad fit for legacy browser support.

# todo
- make available as NuGet package
- Add instructions for `dotnet add package horizn`
- Add license.txt
- Add contributing.md
