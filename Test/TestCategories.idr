module TestCategories

import Categories

-- testing basic composition
C:Type
X:Object C
Y:Object C
W:Object C

F:Hom X Y
G:Hom Y W
H:Hom X W
H = F*G

-- testing identities
LeftE: (f:Hom X Y) -> (f = (E X)*f)
LeftE f = LeftId f

RightE: (f:Hom X Y) -> (f = f*(E Y))
RightE f = RightId f

data GenericIdentity:
  {C:a} ->
  (x:Object C) ->
  Hom x x

data GenericLeftIdentity:
  {C:a} -> {x, y:Object C} ->
  (f:Hom x y) ->
  f = (GenericIdentity x)*f

data GenericRightIdentity:
  {C:a} -> {x, y:Object C} ->
  (f:Hom x y) ->
  f = (GenericIdentity x)*f

IdentityIsUnique:
  {C:a} -> (x, y: Object C) ->
  (GenericIdentity x) = E x
IdentityIsUnique x y =
    rewrite (GenericLeftIdentity (E x)) in
      rewrite RightId (GenericIdentity x) in Refl

-- testing padding
