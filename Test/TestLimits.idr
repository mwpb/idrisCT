module TestLimits

import Categories
import Limits

A:Type
B:Type
C:Type
D:Type
E:Type
A2:Type

W:Hom B D
V:Hom C D

F:Hom A B
G:Hom A C

H: F*W = G*V

Y:Hom A (PB W V)
Y = IntoPB F G H

Z1:Hom (PB W V) E
Z3:Hom E A2
Z2:Hom A A2
Z2 = Y*Z1*Z3
