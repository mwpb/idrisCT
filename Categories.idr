module Categories

%access public export

-- An object can belong to any type a.
data Object: a -> Type where

-- There is a Hom type between any pair of types (a,b).
data Hom: a -> b -> Type where
  E: {C:b} -> (x: Object C) -> Hom x x
  (*): Hom x y -> Hom y z -> Hom x z

-- Equality of arrows in a Hom.
infixr 5 ~~
data (~~): {C:a} -> {x,y:Object C} -> Hom x y -> Hom x y -> Type where
  Id: {C:a} -> {x, y:Object C} -> (f:Hom x y) -> f ~~ f
  Pad: (a:Hom w x) -> f ~~ g -> (b:Hom y z) -> a*f*b ~~ a*g*b
  Transitivity: f ~~ g -> g ~~ h -> f ~~ h
  Symmetry: f ~~ g -> g ~~ f
