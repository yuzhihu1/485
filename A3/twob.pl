:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal, role].

    % parts of speech
        pos sub [n, p, v, det, toinf].
            n sub [].
            p sub [].
            v sub [].
            det sub [].
            toinf sub [].   % infinitival to

    % phrasal categories
    cat sub [vproj, np].
        vproj sub [inf_clause, s, vp] intro [mood:mood, g:n_sem].
            inf_clause intro [mood:infinitive, clause:n_sem].
            s intro [mood:indicative].
            vp intro [mood:indicative].
        np sub [].

        verbal sub [v, vproj] intro [vsem:v_sem].
        nominal sub [n, np] intro [nsem:n_sem].
    
    % mood and tense for verbs
    tense sub [past, present].
        past sub [].    
        present sub [].
    mood sub [indicative, infinitive].
        indicative intro [tense:tense].
        infinitive sub [].

    % semantics for verbs and nouns
    sem sub [v_sem, n_sem].

        % semantics for nouns
        n_sem sub [student, teacher].
            student sub [].
            teacher sub [].
	
    role sub [n_sem, none].
	none sub [].
                               

        % semantics for verbs 
	% This should not be empty!  Fill in features for this and
        % the following subtypes:
        v_sem sub [try, appear, promise, expect, sleep] intro [vtense:tense, agent:role, theme:role, benefit:role, experiencer:role]. 
    
            try sub [] intro [vtense:tense, agent:role, theme:role, benefit:none, experiencer:none].

            appear sub [] intro [vtense:tense, agent:none, theme:role, benefit:none, experiencer:none].

            promise sub [] intro [vtense:tense, agent:role, theme:role, benefit:role, experiencer:none].

            expect sub [] intro [vtense:tense, agent:role, theme:role, benefit:none, experiencer:none].

            sleep sub [] intro [vtense:tense, agent:none, theme:none, benefit:none, experiencer:role].


% Grammar 
% the teacher, the student 
np_rule rule
    np ===>
    cat> det,
    cat> n.

% to sleep
% inf_clause = to + v
infclause_rule rule
    (inf_clause, clause:Exp) ===>
    cat> toinf,
    cat> (v, vsem:(vtense:present, experiencer:Exp)).

% the student appeared to sleep
% vp = v + inf_clause
vp_rule rule
    (vp, vsem:(vtense:past), g:Gap) ===>
    cat> (v, vsem:(vtense:past, agent:none, theme:Gap, benefit:none, experiencer:none)),
    cat> (inf_clause, clause:Gap).

% the student expected the teacher to sleep
% vp = v + np + inf_clause
vp_rule rule
    (vp, vsem:(vtense:past), g:Gap) ===>
    cat> (v, vsem:(vtense:past, agent:Gap, theme:Object, benefit:none, experiencer:none)),
    cat> (np, nsem:Object),
    cat> (inf_clause, clause:Object).

% the student promised the teacher to sleep
% vp = v + np + inf_clause
vp_rule rule
    (vp, vsem:(vtense:past), g:Gap) ===>
    cat> (v, vsem:(vtense:past, agent:Gap, theme:Object, benefit:Object, experiencer:none)),
    cat> (np, nsem:Object),
    cat> (inf_clause, clause:Gap).

% the student tried to sleep
% vp = v + inf_clause
vp_rule rule
    (vp, vsem:(vtense:past), g:Gap) ===>
    cat> (v, vsem:(vtense:past, agent:Gap, theme:Gap, benefit:none, experiencer:none)),
    cat> (inf_clause, clause:Gap).

% S = np + vp
s_rule rule
    (s, g:Subject) ===>
    cat> (np, nsem:Subject),
    cat> (vp, vsem:(vtense:past), g:Subject).


% Lexicon
appeared ---> (v, vsem:(appear, vtense:past, agent:none, theme:Theme, benefit:none, experiencer:none)).

expected ---> (v, vsem:(expect, vtense:past, agent:Agent, theme:Theme, benefit:none, experiencer:none)).

promised ---> (v, vsem:(promise, vtense:past, agent:Agent, theme:Theme, benefit:Benefit, experiencer:none)).

sleep ---> (v, vsem:(sleep, vtense:present, agent:none, theme:none, benefit:none, experiencer:Experiencer)).

tried ---> (v, vsem:(try, vtense:past, agent:Agent, theme:Theme, benefit:none, experiencer:none)).

student ---> (n, nsem:student).

teacher ---> (n, nsem:teacher).

the ---> det.

to ---> toinf.

