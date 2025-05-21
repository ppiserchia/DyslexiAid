# DyslexiAid
**DyslexiAid** is an iOS App that helps dyslexic people understand if a book is easier to read for them.

## How does it work?
When the app is opened, the user will see a button. Once clicked, it will lead to a view that warns the user to keep the phone vertically from the sheet. 

<image src="Screenshots/HomeView.png" width=200 height=430> <image src="Screenshots/WarningView.png" width=200 height=430> 

Once the button **"I'm ready!"** is being tapped, the camera view appears, in order for the user to take a photo of the book. Once taken the photo, the text in it is scanned and counted. Depending on the number of words that are in the scanned page, the result page will be different.

If the **number of words is ≤ 160**, then the results are **positive**. The user can read that book :)

<image src="Screenshots/PositiveView.jpeg" width=200 height=430>

If the **number of words is > 160**, then the results are **negative**. The user can't read that book :( 

<image src="Screenshots/NegativeView.PNG" width=200 height=430>

Whatever the result, the user has the option of being able to access tips by clicking to the **"See some tips!"**.

The **main topics** of the tips are:
* **Alignment**
* **Font Choice**
* **Contrast**
* **Line Height**

<image src="Screenshots/AlignmentView.PNG" width=200 height=430> <image src="Screenshots/FontChoiceView.PNG" width=200 height=430> <image src="Screenshots/ContrastView.PNG" width=200 height=430> <image src="Screenshots/LineSpacingView.PNG" width=200 height=430>

## Why are we taking into account the number of words? 


## Frameworks
* SwiftUI
* Vision
* UIKit

## Credits and Licensing



## Team
DyslexiAid, 
made by Pasquale Piserchia, Cristina Valenziano, Ashish Maddamsetty, Sania Shahpasand, Lorenzo Tarabelli. 
