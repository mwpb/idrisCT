module tests

import definitions

-- testing basic composition

C:Category

X:Object C
Y:Object C
Z:Object C

F:Hom X Y
G:Hom Y Z
H:Hom X Z
H = F*G
