module Categories

%access public export

infixr 10 |> -- make infixes bind differently
mutual
  data Object: a -> Type where
    (|>): {C, D:a} -> Object C -> Hom C D -> Object D

  infixr 10 ||>
  data Hom: a -> a -> Type where
    E: {C:a} -> (x: Object C) -> Hom x x
    (*): Hom x y -> Hom y z -> Hom x z
    (||>):
      {C, D:a} -> {x, y:Object C} -> Hom x y -> (F:Hom C D) ->
      Hom (x|>F) (y|>F)
    (||): -- can we use an implicit x here? why can't we use . as an infix?
      {C,D:a} -> {F,G:Hom C D} -> (n:Hom F G) ->
      (x:Object C) -> Hom (x|>F) (x|>G)

infixr 5 ~~
data (~~): {C:a} -> {x,y:Object C} -> Hom x y -> Hom x y -> Type where
  Id: {C:a} -> {x, y:Object C} -> (f:Hom x y) -> f ~~ f
  Pad: (a:Hom w x) -> f ~~ g -> (b:Hom y z) -> a*f*b ~~ a*g*b
  Transitivity: f ~~ g -> g ~~ h -> f ~~ h
  Symmetry: f ~~ g -> g ~~ f
  FunctorRule:
    {C, D:a} -> {F:Hom C D} -> {x, y, z:Object C} ->
    {f:Hom x y} -> {g:Hom y z} -> (f*g)||>F ~~ (f||>F)*(g||>F)
  FunctorIds:
    {C, D:a} -> {F:Hom C D} -> {x:Object C} -> (E x)||>F ~~ E(x|>F)
  NatTransRule:
    {C,D:a} -> {F,G:Hom C D} -> {N:Hom F G} -> {x,y:Object C} ->
    {f:Hom x y} -> (f||>F)*(N||y) ~~ (N||x)*(f||>G)
