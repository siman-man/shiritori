[![Build Status](https://travis-ci.org/siman-man/shiritori.svg?branch=master)](https://travis-ci.org/siman-man/shiritori)
[![Code Climate](https://codeclimate.com/github/siman-man/shiritori.png)](https://codeclimate.com/github/siman-man/shiritori)
[![Coverage Status](https://coveralls.io/repos/siman-man/shiritori/badge.png)](https://coveralls.io/r/siman-man/shiritori)

# Shiritori

Let's try to create too long method chain!

## Installation

install it yourself as:

    $ gem install shiritori

Let's start creation long method chain.

## Rule

1. You set first object.

2. Input the method that object can use.
  * You can not use the method that has been used once.
  * Don't override or define new method.

3. It continue until the method can not be input.

4. Let's enjoy shiritori!

- block syntax can use only '{}', not use 'do - end' syntax.
- if you want to pass arguments, please enclosed '()'. 
 
## Usage

```
% shiritori                            
Please input first object > "Hello"

+----------------------+
| Current method chain |
+----------------------+
|       "Hello"        |
+----------------------+

+---------------+----------------+
| Current Class | Current Object |
+---------------+----------------+
|    String     |    "Hello"     |
+---------------+----------------+

Please input next method > chars
Exec command "Hello".chars

+----------------------+
| Current method chain |
+----------------------+
|    "Hello".chars     |
+----------------------+

+---------------+---------------------------+
| Current Class |      Current Object       |
+---------------+---------------------------+
|     Array     | ["H", "e", "l", "l", "o"] |
+---------------+---------------------------+

Please input next method > first
Exec command ["H", "e", "l", "l", "o"].first

+----------------------+
| Current method chain |
+----------------------+
| "Hello".chars.first  |
+----------------------+

+---------------+----------------+
| Current Class | Current Object |
+---------------+----------------+
|    String     |      "H"       |
+---------------+----------------+

Please input next method >
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/shiritori/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
