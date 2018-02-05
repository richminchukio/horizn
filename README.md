# Horizn

###### A landscape focused framework for front-end web design. 

Horizn's focus is to make the web's digital publication format more paletable to users on mobile devices. Showing users what they need to see, when they need to see it, regardless of what kind of device they are on, or what orientation they are holding it in.

###### A simple layout with nifty features

```html
<body>
   <input type="checkbox" id="horizn-article-open">
   <div class="horizn-container">
      <div class='horizn-leadin'>
         <h1>site name</h1>
      </div>
      <div class='horizn-timeline'>
         <label for="horizn-article-open">
            <h3>2017.12.15</h3>
         </label>
         <p>Unit Testing on MacOS /&nbsp;Windows</p>
         <label for="horizn-article-open">
            <h3>2017.04.09</h3>
         </label>
         <p>Creating a dotnet core NuGet&nbsp;Package</p>
      </div>
      <div class='horizn-sheet'>
         <p id="horizn-close-article-btn">
            <label for="horizn-article-open">close</label>
         </p>
         <h2>Article Title</h2>
         <p>
            Article body.
         </p>
      </div>
   </div>
</body>
```
