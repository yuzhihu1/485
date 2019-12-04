% Zhihuan Yu, yuzhihu1, 1002106650

bot sub [s, vpsg, vppl, np, pp, npsg, nppl, lexical].
    s sub [].
    vpsg sub [].
    vppl sub [].
    np sub [].
    pp sub [].
    npsg sub [].
    nppl sub [].
    lexical sub [nprp, npl, nsg, vpl, vsg, det, p].	
	nprp sub [].
	npl sub [].
	nsg sub [].
	vpl sub [].
	vsg sub [].
	det sub [].
	p sub [].
	        

% rules
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


% Lexicon 

biscuits ---> npl.

dog ---> nsg.

fido ---> nprp.

feed ---> vpl.

feeds ---> vsg.

the ---> det.

puppies ---> npl.

with ---> p.









