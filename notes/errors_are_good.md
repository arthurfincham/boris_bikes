1. write down the error:

``` bash=
NameError (uninitialized constant DockingStation)
```

2. file path of the error?
``` bash
4: from /Users/arthurfincham/.rvm/rubies/ruby-2.7.3/bin/irb:23:in `<main>'
```

3. line number of the error?

23

4. What causes the error?

NameError is raised when you reference a constant or a variable which isn't defined in the current context. A ruby constant can be a Module, Class, or a CONSTANT_VARIABLE, and must always start with an upper case letter.

You may encounter NameError when:

* There is a typo in your variable name, class name, module name or constant name.
* The file with the class definition isn't loaded in the current context.
* The rubygem which defines these constants is not loaded.
* Full name of the constant not being used, e.g., when you use PI instead of Math::PI
* Another instance of this occurs when you try to define a constant starting with a lower case letter.

5. How can this error be fixed?

By creating a DockingStation class and requiring the file. 
