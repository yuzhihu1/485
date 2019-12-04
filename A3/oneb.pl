% Zhihuan Yu, yuzhihu1, 1002106650

bot sub [cat, noun_feature].
    cat sub [p, det, pp, has_feature].
        p sub [].
	det sub [].
	pp sub [].
    has_feature sub [s, np, vp, n, v] intro [noun:noun_feature].
	s sub [].
	np sub [].
	vp sub [].
	n sub [].
	v sub [].
    noun_feature sub [singular, plural].
   
% rules
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
    cat> np.

np_vp_s rule
    (s, noun:Noun) ===>
    cat> (np, noun:Noun),
    cat> (vp, noun:Noun).


% Lexicon
biscuits ---> (n, noun:plural).

dog ---> (n, noun:singular).

fido ---> (np, noun:singular).

feed ---> (v, noun:plural).

feeds ---> (v, noun:singular).

the ---> det.

puppies ---> (n, noun:plural).

with ---> p.


