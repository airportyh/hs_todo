CLI Todo List
=============

I wrote this program to learn Haskell. [You can too!](http://learnyouahaskell.com/). It's a simple todo list program.

## Usage

Add a task

```
todo add <description of task>
```

List tasks

```
todo
```

Remove a task

```
todo rm <task number>
```

## Example

```
$ todo add refactor haskell program
Added: refactor haskell program
$ todo
1. refactor haskell program
$ todo add publish it and make money
Added: publish it and make money
$ todo
1. refactor haskell program
2. publish it and make money
$ todo rm 1
Removed: refactor haskell program
$ todo
1. publish it and make money
```