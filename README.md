# elm-tfn

Test the validity of a given 8 or 9 digit Australian Tax File Number (TFN).

## Usage

```elm
import Tfn

tfnIsValid = Tfn.isValid "555-000-555"
--> tfnIsValid == True

tfnIsInvalid = Tfn.isValid "123-456-789"
--> tfnIsInvalid == False
```

## Licence

Copyright © 2017 Simon Holywell.
Distributed under Apache 2.0 licence.
