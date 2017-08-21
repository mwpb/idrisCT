# IdrisCT

A collection of type definitions for formal proofs in category theory. Everything is a type; nothing is a record type.

## Getting Started

### Prerequisites

A working installation of Idris. Instruction can be found at the
[official Idris website](https://github.com/idris-lang/Idris-dev/wiki/Installation-Instructions).

### Installing

For global installation use:

```
idris --install idrisCT.ipkg
```

from the root directory of the repo.

Otherwise simply copy the file `definitions.idr` into the root of your project.

In either case include using

```
import Categories
```

immediately after declaring your module. (The file `tests.idr` is a very simple example.)
