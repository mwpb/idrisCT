module Functors

import Categories

-- Functor application on objects.
infixr 7 |>
data (|>): {C, D:a} -> Object C -> Hom C D -> Object D
-- Functor application on arrows.
infixr 10 ||>
data (||>):
  {C, D:b} -> {x, y:Object C} -> Hom x y -> (F:Hom C D) ->
  Hom (x|>F) (y|>F)
data FunctorRule:
  {C, D:a} -> {F:Hom C D} -> {x, y, z:Object C} ->
  {f:Hom x y} -> {g:Hom y z} -> (f*g)||>F ~~ (f||>F)*(g||>F)
data FunctorIds:
  {C, D:a} -> {F:Hom C D} -> {x:Object C} -> (E x)||>F ~~ E(x|>F)
-- Component of natural transformation at an object.
data (||):
  {C,D:a} -> {F,G:Hom C D} -> (n:Hom F G) ->
  (x:Object C) -> Hom (x|>F) (x|>G)
data NatTransRule:
  {C,D:a} -> {F,G:Hom C D} -> {N:Hom F G} -> {x,y:Object C} ->
  {f:Hom x y} -> (f||>F)*(N||y) ~~ (N||x)*(f||>G)
