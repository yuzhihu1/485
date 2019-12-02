bot sub [cat, noun_feature].
    cat sub [p, det, pp, has_feature].
    has_feature sub [s, np, vp, n, v] intro [noun:noun_feature].
    noun_feature sub [singular, plural].
   
fido ---> (np, noun:singular).
biscuits ---> (n, noun:plural).
feed ---> (v, noun:plural).
feeds ---> (v, noun:singular).
the ---> det.
dog ---> (n, noun:singular).
puppies ---> (n, noun:plural).
with ---> p.

p_np_pp rule
    pp ===>
    cat> p,
    cat> (np, noun:Noun).

rule_np rule
    (np, noun:plural) ===>
    cat> (n, noun:plural).

rule_np rule
    (np, noun:plural) ===>
    cat> (n, noun:plural),
    cat> pp.

rule_np rule
    (np, noun:singular) ===>
    cat> det,
    cat> (n, noun:singular).

rule_np rule
    (np, noun:singular) ===>
    cat> det,
    cat> (n, noun:singular),
    cat> pp.

v_np_vp rule
    (vp, noun:Noun) ===>
    cat> (v, noun:Noun),
    cat> (np, noun:Noun).

np_vp_s rule
    (s, noun:Noun) ===>
    cat> (np, noun:Noun),
    cat> (vp, noun:Noun).

