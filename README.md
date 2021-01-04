# Horizn (2.0.0, #beta)

## What is Horizn?

### A landscape focused strategy for blogging.

Horizn's focus is to make the web's digital publication format (blogs) more palatable to users of all device sizes and varying accessibility levels. Horizn pays a great deal of attention to semantic HTML without sacrificing on appearances. Horizn shows your visitors what they need to see, when they need to see it, regardless of what kind of device they are on, what orientation they are holding it in. 

Horizn is the default layout for [GHK](https://github.com/rjminchuk/ghk).

### Features, State, and Technical Details

Horizn is not a CSS framework, it is a CSS strategy for handling devices of many sizes. Since Horizn was developed with blogging in mind, it can represent two states; (HTML `<article>` element present): a visitor reading a blog article, and (HTML `<article>` element not present): a visitor not reading a blog article. 

The underlying style system relies on CSS sibling selectors to determine the view the user will get back. Simply leave out the `<article>` element when there is no blog article to display, and horizn will resize the remaining content accordingly. 

Additional Horizn features:

- A prominent horizontal "hero" image.
- Full device width images (mobile only) that bleed into device specific inset areas.
- Thoughtful positioning of hierarchically semantic navigation.
- Dueling scrollable areas which accentuate article content.
- Optional article styling. Content that looks and behaves well out of the box for desktop and mobile devices.
- Built in light (and optionally dark) mode styling.

Horizn has no dependencies on JavaScript, and future iterations of Horizn will not require JS. Any additional JS features will be a la carte.

### The Moving Parts

There are three main HTML elements that drive the layout of Horizn. *They are required to be immediate children of the body element, and are required to be in the following order:*

1. `<article>` - The area your blog article goes. (optional)
2. `<aside>` - An area for complimentary resources. IE: a time-line of article links. (optional)
3. `<header>` - A nice place for an author photo, the name of your blog, or maybe a link to your github. ;)

> Note: While Screen Reader support for the [aria-owns](https://www.w3.org/TR/wai-aria/#aria-owns) property remains limited, the semantic approach to Horizn's HTML arguably provides a reasonably accessible user experience. Features like _sticky positioned navigation_ have been avoided in mobile views for accessibility sake as well.

### What shows and when?

Only the most important content for the size and orientation of your device is shown. There are 5 different scenarios covering 12 possible device sizes, orientations, and states.

> | **KEY** | |
> |---:|:---|
> | "`<article>` Only" | only the article element is visible |
> | "`<header>` Over `<aside>`" | The header element is stacked on top of the aside |
> | "`<header>`, `<aside>`" | the aside element is pinned right of the header element |
> | "`<header>`, `<article>`" | the article element is pinned right of the header element |
> | "`<header>`, `<aside>`, `<article>`" | the aside element is pinned right of the header element, followed by the article element |

|                   | *ARTICLE ELEMENT PRESENT*          | *ARTICLE ELEMENT NOT PRESENT*     |
|:------------------|:-----------------------------------|:----------------------------------|
| **LANDSCAPE**     |                                    |                                   |
| Handheld / Mobile | `<article>` Only                   | `<header>` Over `<aside>`         |
| Medium / Tablet   | `<header>`, `<article>`            | `<header>`, `<aside>`             |
| Large / Desktop   | `<header>`, `<aside>`, `<article>` | `<header>`, `<aside>`             |
| **PORTRAIT**      |                                    |                                   |
| Handheld / Mobile | `<article>` Only                   | `<header>` Over `<aside>`         |
| Medium / Tablet   | `<article>` Only                   | `<header>`, `<aside>`             |
| Large / Lg Tablet | `<header>`, `<article>`            | `<header>`, `<aside>`             |

> **Gotchas** 
> 
> In almost all scenarios, the `<article>` element must be removed from the DOM in order to see the `<aside>` or `<header>` elements. ***ALWAYS*** provide a way for the user to remove the `<article>` element, be it through the dom, or through forward/backward navigation. The ability to remove the article element is baked into the article navigation within the `./src/template.htm` file in this repository.

---

## Technical

### A working example

[richminchuk.io](https://richminchuk.io) is the dev site for my personal blogging utility, [GHK](https://github.com/rjminchuk/ghk).

Or try it out for yourself. Clone this repository, docker build and run a horizn example web page in nginx.

```sh
npm run docker
```

### How can I add Horizn to a new project?

`horizn` is available as a node package. Install it and copy it to your publish directory.

```sh
npm install horizn
mkdir -p ./wwwroot/dist/horizn/css/
cp ./node_modules/horzin/dist/css/ ./wwwroot/dist/horizn/css/
```

### The minimum layout 

```html
<!DOCTYPE html>
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, viewport-fit=cover" />
      <link rel="stylesheet" href="./dist/horizn/css/horizn-min.css">
   </head>
   <body>
      <article>
         <nav>
            <a href="#">article specific navigation</a>
         </nav>
         <h1>Your Article Title</h1>
         <p>Your article content</p>
      </article>
      <aside>
         <nav>
            <a href="#">aside (or sidebar) specific navigation</a>
         </nav>
         <ol>
            <li>
               <div><a href="#">A List of Your Articles by Date</a></div>
               <div><time datetime="2020-01-04T00:00:00Z">2020.12.27</time></div>
               <p>Possibly the SEO description of your article.</p>
            </li>
         </ol>
      </aside>
      <header>
         <nav>
            <a href="#">yourwebsite.com</a>
            <a href="#">other navigation</a>
         </nav>
         <picture>
            <img src="./resources/pexels-lucas-allmann-442559.jpg" alt="Photo by Lucas Allmann from Pexels of a man looking out into the wilderness">
            <!-- https://www.pexels.com/photo/adult-adventure-backpack-daylight-442559/ -->
         </picture>
         <h1>Your Website Name Here</h1>
         <p>A tagline for your website.</p>
      </header>
   </body>
</html>
```

### When should I not use Horizn?

Horizn uses flexbox without browser prefixes & uses the CSS `calc()` function extensively, making it a bad fit for legacy browser support.

## Build and try it yourself

if you have docker installed you can easily run a horizn example in nginx yourself at [localhost:8080](http://localhost:8080).

```sh
git clone git@github.com:rjminchuk/horizn.git
cd horizn
npm install
# translate less to css and minify
npm run all
# test the latest beta
npm run docker
# or test local changes
npm run docker-local-files
```
