# Problem Set 7 

## Learning Objectives 

- Build upon the time serires data management that you invested in for the last problem set and start to produce predictions given input series. 
- Evaluate how well regression models are doing *in-sample* using information criteria scoring for model performance. 
- Use each of the four data smoothers presented in async lecture, and then make predictions using these smoothers. 
- Evaluate how well models are doing *out-of-sample* using mean squared error in out of sample predictions.  

## Task 

This problem set will re-use some of the data that you worked with last week -- so hopefully you can build upon the code that you wrote to do the cleaning and management! If there are parts where you took "shortcuts" or where you think that you could accomplish the task in a more sustainable way, you can consider modifying your code. Or, if you're reasonably satisfied with the code that you wrote, you might consider pulling that code out into its own set of more modular functions so that you can re-use them. 

## Method of Submitting 

You must submit a PDF of your compiled analysis and your code (.rmd) to Gradescope.

## Guidance for your work

- There is no page limit -- and there is no page requirement. And so, be succinct, but complete in your analysis and reporting. There is no reason to modify fontsize, margins, or line spacing, so please don't!  
- Each student needs to complete their own assignment. We encourage you to work together as a study group, but this should be a collaborative environment where every member of that group is made better by every other member's presence. Students are expected to act with regard to UC Berkeley Academic Integrity
  - This means that you should not simply share code without collaborating on it. 
  - This means that people who are working as a study group have to all participate. 
- Answers should clearly explain your reasoning; do not simply 'output dump' the results of code without explanation. You have to create an argument, and written narrative that describes your thinking: Why have you done what you have done? What do you hope to learn from it? What have you actually learned?  
- Using libraries: 
  - You may use any part of the `tidyverse` and you may also use `data.table` for data wrangling. 
  - You may use any library that is presented in the course for the statistical analysis.
  - You may use any library that we have included in the package loads block of this file. 
  - But, try to constrain yourselves from searching out *that one other library* that does one task. Instead, write that yourself! 
- For mathematical formulae, type them in your R markdown file, using the correct $\LaTeX$. There are enough examples of success with this, that you can do it. 
- Use inline code evaluation to print results from objects into the printed page. 
