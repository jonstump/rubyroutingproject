# Ruby Routing Project for Epicodus
#### By: Jon Stump
<img align="center" src="https://avatars2.githubusercontent.com/u/59323850?s=460&u=372c7d529b7379408ae54491ab3449b6e2f4d94d&v=4">

* * *

## Description
This is a website that allows for users to enter words and the definitions that they believe go with those words.

You can view a working version of the page [here](https://ancient-atoll-06147.herokuapp.com/words)

* * *

## Technologies used
* Ruby
* Rspec
* Pry
* Capybara
* Heroku
* Sinatra
* Heroku
* C8H10N4O2

* * *

## Specs
Initial Specs:
| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
| Should allow a user to input a word with their username  | word: Duck, username: Donald | word Duck in a clickable list of words. |
| Should allow a user to input a definition to a word with their username | Def: "a water fowl", username: Donald | Definitions in a clickable list |
| Allow for a definition to be updated  | Updated definition: "My last name" | "a water fowl" will be replaced with "My last name" |
| Ability to delete a definition  | click Delete on the definition page | This removes the definition from the list on the word page |

* * *

## Installation :

* Go to ( https://github.com/jonstump/rubyroutingproject ).

*  Navigate to the code button on the github website.

* Click on the code button to open the menu.

- Copy the HTTPS code by clicking the clipboard next to the link.

- Within your Bash terminal navigate to your desired location by using cd fallowed by your desired directory.

```bash
 cd Desktop
```

- Once you have chosen your desired directory use the command.
```bash
git clone https://github.com/jonstump/rubyroutingproject
```

<div
  style="
    background-color: #d1ecf1;
    color: grey; padding: 6px;
    font-size: 9px;
    border-radius: 5px;
    border: 1px solid #d4ecf1;
    margin-bottom: 12px"
>
  <span
    style="
      font-size: 12px;
      font-weight: 600;
      color: #0c5460;"
  >
    ⓘ
  </span>
  <span
    style="
      font-size: 12px;
      font-weight: 900;
      color: #0c5460;
      margin-bottom: 24px"
  >
    Note :
  </span>
  If you have any problems make sure your HTTPS code is correct! The example above might not be the most recent HTTPS code!
</div>

* Now that the project is downloaded you will need to run the command 'bundle install' to install all of the gems from the Gemfile.

``` bash
bundle install
```

* In oder to run the tests enter 'rspec' into your terminal.

``` bash
bundle install
```

* If you would like to see the code use the command "editor ." (where editor is your code editor. example code for VScode and vim for Vim) to open the project in your code editor.

``` bash
code .
```

* To launch a local version of the site in your browser enter the following:

``` bash
ruby app.rb
```
This will launch a local host via Sinatra. You should be able to navigate to http://localhost:4567/ to see the site locally.

## To dos:
* Deploy to Heroku

## Bugs:
* No known bugs. Please submit any bugs found to the email below

* * *

## License
> [GPLv3](https://choosealicense.com/licenses/gpl-3.0/)\
> Jon Stump &copy; 2021

* * *

## Contact Information
_Jon Stump: [Email](jmstump@gmail.com)_