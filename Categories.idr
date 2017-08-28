module Categories

%access public export

-- An object can belong to any type a.
data Object: a -> Type where

-- There is a Hom type between any pair of types (a,b).
data Hom: a -> b -> Type where
  E: {C:b} -> (x: Object C) -> Hom x x
  (*): Hom x y -> Hom y z -> Hom x z

-- Generic equalities of arrows in a Hom.
data LeftId: {C:a} -> {x, y:Object C} -> (f:Hom x y) -> f = (E x)*f
data RightId: {C:a} -> {x, y:Object C} -> (f:Hom x y) -> f = f*(E y)
data Pad: (a:Hom w x) -> f = g -> (b:Hom y z) -> a*f*b = a*g*b
