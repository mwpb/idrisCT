# IdrisCT

A collection of type definitions for formal proofs in category theory. Everything is a type; nothing is a record type.

## Getting Started

### Prerequisites

A working installation of Idris. Instructions can be found in the
[Idris documentation](https://github.com/idris-lang/Idris-dev/wiki/Installation-Instructions).

### Installing

For global installation use:

```
idris --install idrisCT.ipkg
```

from the root directory of the repo. For local installation simply copy the file `Categories.idr` into the root of your project (and add it to `yourProject.ipkg` if using the Atom editor for instance).

In either case include in your `.idr` file using

```
import Categories
```

shortly after declaring your module. (The file `Test/testTest.idr` is a very simple example.)

### Usage examples

Some initial examples:

* [basic composition](./Test/testTest.idr)
* ...

## Running the tests

At the moment just compile the files in the `Test` directory.

## Built with

* The [Idris Language](https://www.idris-lang.org).
