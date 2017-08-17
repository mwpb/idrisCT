module CT

-- Data describing the composition of arrows.
data HOM: Type -> Type -> Type
data (*): HOM a b -> HOM b c -> HOM a c
data E: (a:Type) -> HOM a a
data Left_identity: (f:HOM x y) -> (E x)*f = f
data Right_identity: (f:HOM x y) -> f*(E y) = f
data Assoc: (f:HOM x y) -> (g:HOM y z) -> (h:HOM z w) -> (f*g)*h = f*(g*h)

-- Elementary properties of composition.
Left_intro: (f:HOM x y) -> (g,h:HOM y z) -> (g=h) -> (f*g=f*h)
Left_intro f g h = cong
Right_intro: (f:HOM y z) -> (g,h:HOM x y) -> (g=h) -> (g*f=h*f)
Right_intro f g h Hgh = rewrite Hgh in Refl

-- Results involving specific variables and assertions.

X: Type
Y: Type
Z: Type
F: HOM X Y
G: HOM Y Z
H: HOM Y Z
EqGH: G=H

K:HOM X Z
K = F*G
L:HOM X Y
L = F*(E Y)

Left_intro_theorem: F*G = F*H
Left_intro_theorem = Left_intro F G H EqGH
