# README

**Ruby version

**System dependencies

**Configuration

**Database creation

**Database initialization

**How to run the test suite

**Services (job queues, cache servers, search engines, etc.)

**Deployment instructions

*Beyond Finance Rails Take Home
For your sample project, you’ll be creating a Rails app. 
Imagine a platform for creating and serving Visual Experiences. For the 
purposes of this exercise, we’ll slim down “Visual Experience” to just “an 
image.” 
The deliverable for this exercise is a Rails app that renders a Campaign 
page (campaigns#show). The page should show the Campaign’s name, 
email address of the user who created it, and the date on which it was 
created. 
A Campaign also has a list of associated assets. Each asset has an 
ordered list of associated “criteria”, and whichever criteria is selected will 
determine the image to be served. 
The campaigns page should list all of its associated assets, as well as their 
associated criteria. So that you don’t have to deal with actually accepting 
image uploads, you can just hard-code a static thumbnail for them here. 
Sample JSON representation of an asset: 
`{ 
name: ‘asset 1’,
criteria: [
{type: “device”, operand: “iphone”, image: https://s3url.com/image.png, order: 1}, 
{type: “device”, operand: “android”, image: “https://s3url.com/other_image.png”, order: 2}, {type: “nested”, 
image: “https://s3url.com/old_image”, order: 3, criteria: [ 
{type: “device”, operand: “windows_phone”}, 
{type: “device”, operand: “palm_pilot”} ]}, 
{type: “always”, operand: null, order: 1000, image: “https://s3url.com/default.png”} 
] }`
The assets are fine showing the image in text as shown above. This 
exercise should not be concerned with the actual rendering of assets. 
Here, we are only building a page to display campaigns.
We would also like to see a way to create assets as well, but you don’t 
need a front-end for this. You can rely solely on your tests/specs to interact 
with those controller action appropriately. As you can see, criteria can be 
nested. This has implications at render time, but you don’t have to worry 
about that. What you will have to worry about is what payload to expect in 
the create action to facilitate that.
