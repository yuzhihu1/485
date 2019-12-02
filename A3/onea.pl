bot sub [s, vpsg, vppl, np, pp, npsg, nppl, det].
    lexical sub [nprp, npl, nsg, vpl, vsg, det, p].	        

fido ---> nprp.
biscuits ---> npl.
feed ---> vpl.
feeds ---> vsg.
the ---> det.
dog ---> nsg.
puppies ---> npl.
with ---> p.

rule_np rule
    np ===>
    cat> npsg.

rule_np rule
    np ===>
    cat> nppl.


vsg_np_vpsg rule
    vpsg ===>
    cat> vsg,
    cat> np.

vpl_np_vppl rule
    vppl ===>
    cat> vpl,
    cat> np.

p_np_pp rule
    pp ===>
    cat> p,
    cat> np.

rule_npsg rule
    npsg ===>
    cat> nprp.

rule_npsg rule
    npsg ===>
    cat> det,
    cat> nsg.

rule_npsg rule
    npsg ===>
    cat> det,
    cat> nsg,
    cat> pp.

rule_nppl rule
    nppl ===>
    cat> det,
    cat> npl.

rule_nppl rule
    nppl ===>
    cat> det,
    cat> npl,
    cat> pp.

rule_nppl rule
    nppl ===>
    cat> npl.

rule_nppl rule
    nppl ===>
    cat> npl,
    cat> pp.

npsg_vpsg_s rule
    s ===>
    cat> npsg,
    cat> vpsg.

nppl_vppl_s rule
    s ===>
    cat> nppl,
    cat> vppl.












