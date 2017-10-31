module Categories

%access public export

-- An object can belong to any type a.
data Object: a -> Type

-- There is a Hom type between any pair of types (a,b).
data Hom: a -> b -> Type where
  Id: {C:b} -> (x: Object C) -> Hom x x -- bad name....
  (*): Hom x y -> Hom y z -> Hom x z

-- Generic equalities of arrows in a Hom.
data LeftId:
  {C:a} -> {x, y:Object C} ->
  (f:Hom x y) ->
  f = (Id x)*f
data RightId:
  {C:a} -> {x, y:Object C} ->
  (f:Hom x y) ->
  f = f*(Id y)
data Pad:
  (a:Hom w x) -> f = g -> (b:Hom y z) ->
  a*f*b = a*g*b
data Assoc:
  {C:a} -> {w, x, y, z:Object C} ->
  (f:Hom w x) -> (g:Hom x y) -> (h:Hom y z) ->
  f*(g*h) = (f*g)*h
