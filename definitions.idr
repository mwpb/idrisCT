module CT

data Category: Type
data Func: Category -> Category -> Type
data NatTrans: {C, D:Category} -> Func C D -> Func C D -> Type

infixr 10 |>
data Object: Category -> Type where
  (|>): {C, D:Category} -> Object C -> Func C D -> Object D

infixr 10 ||>
data Hom: {C:Category} -> Object C -> Object C -> Type where
  E: {C:Category} -> (x: Object C) -> Hom x x
  (*): Hom x y -> Hom y z -> Hom x z
  (||>):
    {C, D:Category} -> {x, y:Object C} -> Hom x y -> (F:Func C D) ->
    Hom (x|>F) (y|>F)

infixr 10 ~~
data (~~): {C:Category} -> {x,y:Object C} -> Hom x y -> Hom x y -> Type where
  Id: {C:Category} -> {x, y:Object C} -> (f:Hom x y) -> f ~~ f
  Pad: (a:Hom w x) -> f ~~ g -> (b:Hom y z) -> (a*f*b) ~~ (a*g*b)
  Transitivity: f ~~ g -> g ~~ h -> f ~~ h
  Symmetry: f ~~ g -> g ~~ f
  Functor:
    {C, D:Category} -> {F:Func C D} -> {x, y, z:Object C} ->
    {f:Hom x y} -> {g:Hom y z} -> ((f*g)||>F) ~~ ((f||>F)*(g||>F))
  FunctorIds:
    {C, D:Category} -> {F:Func C D} -> {x:Object C} -> ((E x)||>F) ~~ (E(x|>F))

-- record Category where
--   constructor MkCategory
--   obj: Type
--   hom: obj -> obj -> Type
--   comp: {a, b, c:obj} -> hom a b -> hom b c -> hom a c
--
-- interface Compose obj where
--   Caty: Type
--   Hom: Obj -> Obj -> Type
--   (*): {a, b, c:Obj} -> Hom a b -> Hom b c -> Hom a c
--
-- Compose Category where
--   Caty

-- Obj:Type
-- Hom:Obj->Obj->Type
-- C: Category Obj Hom
-- X: Obj
-- Y: Obj
-- Z: Obj
-- F: Hom X Y
-- G: Hom Y Z
-- H: Hom X Z
-- H = comp F G


-- Elementary properties of composition.
-- Left_intro: (f:HOM x y) -> (g,h:HOM y z) -> (g=h) -> (f*g=f*h)
-- Left_intro f g h = cong
-- Right_intro: (f:HOM y z) -> (g,h:HOM x y) -> (g=h) -> (g*f=h*f)
-- Right_intro f g h Hgh = rewrite Hgh in Refl
--
-- -- Results involving specific variables and assertions.
--
-- X: Type
-- Y: Type
-- Z: Type
-- F: HOM X Y
-- G: HOM Y Z
-- H: HOM Y Z
-- EqGH: G=H
--
-- K:HOM X Z
-- K = F*G
-- L:HOM X Y
-- L = F*(E Y)
--
-- Left_intro_theorem: F*G = F*H
-- Left_intro_theorem = Left_intro F G H EqGH
