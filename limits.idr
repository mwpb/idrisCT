module Limits

import Categories

data PB:
  {B, C, D:Type} ->
  (w:Hom C D) -> (v:Hom B D) ->
  Type

data IntoPB:
  {A, B, C, D: Type} -> {w:Hom B D} -> {v:Hom C D} ->
  (f:Hom A B) -> (g:Hom A C) -> (bw=cv) ->
  Hom A (PB w v)

data TerminalObject:
  a ->
  Object a
data TerminalArrow:
  {C:a} ->
  (x:Object C) ->
  Hom x TerminalObject
data TerminalUnique:
  {C:a} -> {x:Object C} ->
  (f:Hom x TerminalObject) -> (g:Hom x TerminalObject) ->
  f=g

data Limit:
  {J, C:a} ->
  (D:Hom J C) ->
  Type
data LimitObject: -- shouldn't be data declarations...
  {J, C:a} -> {D:Hom J C} ->
  (Limit D) ->
  Hom (TerminalObject a) C
data Factorisation:
  {J, C:a} -> {D:Hom J C} ->
  (X:Hom (TerminalObject a) C) ->
  Hom X (Limit D)
data FactorisationUnique:
  {J, C:a} -> {D:Hom J C} -> {X:Hom (TerminalObject a) C} ->
  (First:Hom X (Limit D)) -> (Second:Hom X (Limit D)) ->
  First = Second
