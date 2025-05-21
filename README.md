# DyslexiAid
**DyslexiAid** is an iOS App that helps dyslexic people understand if a book is readable or not by them.

## How does it work?
When the app is opened, the user will see a button. Once clicked, it will lead to a view that warns the user to keep the phone vertically from the sheet. 

<image src="Screenshots/HomeView.png" width=200 height=430> <image src="Screenshots/WarningView.png" width=200 height=430> 

Once the button **"I'm ready!"** is being tapped, the camera view appears, in order for the user to take a photo of the book. Once taken the photo, the text in it is scanned and counted. Depending on the number of words that are in the scanned page, the result page will be different.

If the **number of words is ≤ 160**, then the results are **positive**. The user can read that book :)

<image src="Screenshots/PositiveView.jpeg" width=200 height=430>

If the **number of words is > 160**, then the results are **negative**. The user can't read that book :( 

<image src="Screenshots/NegativeView.PNG" width=200 height=430>

Whatever the result, the user has the option of being able to access tips by clicking to the **"See some tips!"**.


## Frameworks
* SwiftUI
* Vision
* UIKit

## Team
DyslexiAid, 
made by Pasquale Piserchia, Cristina Valenziano, Ashish Maddamsetty, Sania Shahpasand, Lorenzo Tarabelli. 
