module Limits

import Categories

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
  Hom (TerminalObject a) C
data Factorisation:
  {J, C:a} -> {D:Hom J C} ->
  (X:Hom (TerminalObject a) C) ->
  Hom X (Limit D)
data FactorisationUnique:
  {J, C:a} -> {D:Hom J C} -> {X:Hom (TerminalObject a) C} ->
  (First:Hom X (Limit D)) -> (Second:Hom X (Limit D)) ->
  First = Second
