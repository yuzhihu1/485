from nltk.parse.generate import generate, demo_grammar
from nltk import CFG
import nltk
nltk.download('punkt')

g = """ S -> NP VP | VP | Aux NP VP | Whp VP | Wh Aux NP Vh | Wr Aux NP VP 
        NP -> N | Det N | Adj N 
        PP -> P NP
        VP -> V Adv | V NP Adv | V NP Adv PP
        Whp -> Wh | Wh Aux 
        Vh -> V | V Adv | V Adv PP
        Det -> 'the' | 'their' | 'your'
        Adj -> 'old' | 'red' | 'happy'
        Adv -> 'quickly' | 'slowly'
        N -> 'dogs' | 'parks' | 'statues' | 'people'
        V -> 'race' | 'walk' | 'eat'
        P -> 'in' | 'to' | 'on' | 'under' | 'with'
        Aux -> 'will' | 'should' 
        Wh -> 'who' | 'what'
        Wr -> 'where'
         """
g2 = """
    S -> NP VP
    NP -> Det N
    NP -> NP PP
    VP -> VP PP
    VP -> V NP PP
    VP -> V NP
    PP -> P NP
    NP -> 'I'
    Det -> 'the'
    Det -> 'a'
    N -> 'man'
    V -> 'saw'
    P -> 'in'
    P -> 'with'
    N -> 'park'
    N -> 'dog'
    N -> 'statue'
    Det -> 'my'
    """
grammar = CFG.fromstring(g2)

test = input("type test: ")
passed = False

while test != "q":
    s = nltk.tokenize.word_tokenize(test)
    parser = nltk.parse.BottomUpChartParser(grammar)

    for t in parser.parse_all(s):
        print(t)
        passed = True

    if not passed:
        print("No Parses")
    passed = False
    test = input("type test: ")

"""The addition of NP -> NP PP | Det N causes continuous loop of a 
non-terminal pointing to a non-terminal. As such it causes an infinite 
recursion. By switching it such that NP -> Det N | NP PP it appears to solve 
the problem as by ending the NP-loop when the parser finds a noun preceded by a 
determiner. Indeed this works well for the given example 
of "my dog saw a man in the park". However, 
this does not work in the general case as you cannot guarantee 
that a noun will always have a determiner in front. As such, you cannot 
guarantee that it won't reach NP -> NP PP. An example using the base ' \
                     'vocabulary of the rdparser would be the sentence “Dogs ate man”. """