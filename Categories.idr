module Categories

%access public

data Category: Type
data Func: Category -> Category -> Type
data NatTrans: {C, D:Category} -> Func C D -> Func C D -> Type

infixr 10 |> -- make infixes bind differently
data Object: Category -> Type where
  (|>): {C, D:Category} -> Object C -> Func C D -> Object D

infixr 10 ||>
data Hom: {C:Category} -> Object C -> Object C -> Type where
  E: {C:Category} -> (x: Object C) -> Hom x x
  (*): Hom x y -> Hom y z -> Hom x z
  (||>):
    {C, D:Category} -> {x, y:Object C} -> Hom x y -> (F:Func C D) ->
    Hom (x|>F) (y|>F)
  (||): -- can we use an implicit x here? why can't we use . as an infix?
    {C,D:Category} -> {F,G:Func C D} -> (n:NatTrans F G) ->
    (x:Object C) -> Hom (x|>F) (x|>G)

infixr 10 ~~
data (~~): {C:Category} -> {x,y:Object C} -> Hom x y -> Hom x y -> Type where
  Id: {C:Category} -> {x, y:Object C} -> (f:Hom x y) -> f ~~ f
  Pad: (a:Hom w x) -> f ~~ g -> (b:Hom y z) -> (a*f*b) ~~ (a*g*b)
  Transitivity: f ~~ g -> g ~~ h -> f ~~ h
  Symmetry: f ~~ g -> g ~~ f
  FunctorRule:
    {C, D:Category} -> {F:Func C D} -> {x, y, z:Object C} ->
    {f:Hom x y} -> {g:Hom y z} -> ((f*g)||>F) ~~ ((f||>F)*(g||>F))
  FunctorIds:
    {C, D:Category} -> {F:Func C D} -> {x:Object C} -> ((E x)||>F) ~~ (E(x|>F))
  NatTransRule:
    {C,D:Category} -> {F,G:Func C D} -> {n:NatTrans F G} -> {x,y:Object C} ->
    {f:Hom x y} -> ((f||>F)*(n||y)) ~~ ((n||x)*(f||>G))
