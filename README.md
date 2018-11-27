# NASA-Image-Search

<strong>Architecture</strong>

I have built the app using an MVP architecture. This decision was motivated by a desire to avoid the large, complex view controllers that arise from Apple's traditional MVC approach. A substantial amount of code relating to the view objects exists in the view controller classes so I feel it’s better to treat them as part of the view, and move the handling of model data and business logic to a separate set of classes (in this case presenters). Another advantage of moving these things out of the view controller classes is the increase in testability it affords, as view controller classes are usually very difficult to test due the dependence on UIKit.

An alternative approach would have been to use the MVVM architecture which would achieve a similar distribution of resolubility, however due my inexperience with the frameworks required to utilise this pattern properly I have chosen to stick with MVP, as there was a the small amount of time given to complete this project. I am planning to refactor the app to MVVM later as a means of teaching myself Rx Swift. Besides, I think it can be argued that the drawback of the increased dependency brought by a reactive programming framework such as Rx Swift doesn’t outweigh it's benefits for a project of this limited scope.

The model of the class emulates the structure of the JSON returned by the NASA API so that JSON responses can be decoded into model objects with a simple call to JSONDecoder.

I have implemented a network layer which uses a protocol orientated approach to handle all API requests. It should be able to handle requests to other REST APIs with only a small amount of additional code, by implementing the RequestType protocol and providing Model classes which conform to a JSON response.

To optimize loading times, on the results page the application only requests the image thumbnails, then upon selecting an image and moving the detail view page the full image is downloaded and displayed.

<strong>Libraries</strong>

I decided to use the native URLSession class for the network calls in this project as opposed to a library such as Alamofire, as the amount of code saved by using Alamofire would in this case have been minimal and it’s extra utilities would have been unused. I believe it is always better to use a native approach when possible rather than relying on 3rd party APIs in order to reduce to code’s dependency on 3rd parties beyond control. Code that is heavily reliant on 3rd party libraries can often break when updates occur and there is no guarantee of long term support.

I did however decide to include the Kingfisher library in this project which asynchronously downloads and caches images from the webservice. I do not believe this solution to be ideal for the reasons I just stated, however given the 48 hour restriction on this project, I felt it necessary to take the path of least resistance in this case as it saved me writing code I wasn’t sure I’d have time to do. Ideally I would have implemented a custom solution based on the UICache data structure.


<strong>Further work</strong>

I plan to keep working on this app in my own time for a bit since it’s been fun and can be a good opportunity for me to learn some new things. Here’s a quick list of features I’d like to implement

Refactor to MVVM using Rx Swift<br>
Full test coverage<br>
Use prefetching to optimise loading of results<br>
Search based on date, title, key words, location, center<br>
Full screen view of images<br>
