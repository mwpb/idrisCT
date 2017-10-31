module TestLimits

import Categories
import Limits

A:Type
B:Type
C:Type
D:Type
E:Type

W:Hom B D
V:Hom C D

F:Hom A C
G:Hom A B

H: fw = gv

Y:Hom A (PB w v)
Y = IntoPB F G H
