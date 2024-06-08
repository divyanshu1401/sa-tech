# Tendable Coding Assessment

## Usage

```sh
bundle
ruby questionnaire.rb
```

## Goal

The goal is to implement a survey where a user should be able to answer a series of Yes/No questions. After each run, a rating is calculated to let them know how they did. Another rating is also calculated to provide an overall score for all runs.

## Requirements

Possible question answers are: "Yes", "No", "Y", or "N" case insensitively to answer each question prompt.

The answers will need to be **persisted** so they can be used in calculations for subsequent runs >> it is proposed you use the pstore for this, already included in the Gemfile

After _each_ run the program should calculate and print a rating. The calculation for the rating is: `100 * number of yes answers / number of questions`.

The program should also print an average rating for all runs.

The questions can be found in questionnaire.rb

Ensure we can run your exercise

## Approach

We will loop through the questions hash and take user input for each of the question.
We will convert the user response to lower case to implement case insensitivity during comparision.
We will compare the value entered by user with our array 'yes_variants'. If any of the value in the array matches the user respose, we will increment the yes_count variable(initially set to 0) by 1.
After looping through all the questions we will call the do_report method. In the do report method, first we will calculate the rating of the current based on the yes_count variable using the given formula.
Then we will update the pstore object, calculate the average and print it on the screen.

## Bonus Points

Updated readme with an explanation of your approach

Unit Tests

Code Comments

Dockerfile / Bash script if needed for us to run the exercise

