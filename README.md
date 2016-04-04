Task
----

- Develop an application using Rails4 in which the user enters a word and the application return the meanings of it.

- If the meaning of a word already exists in the application database, use them, if not, consume the http://www.dictionaryapi.com/ and store in the local database.

- Follow the W3C standards for semantic HTML.

- Develop frontend using mandatory Bootstrap.

- Write *automated tests*


### How to setup

```sh-session
$ bundle install
```

### How to run the app

```sh-session
Put your DICTIONARY_API_KEY in a .env file
$ rails s
```

### How to run specs

```sh-session
$ rspec
```
