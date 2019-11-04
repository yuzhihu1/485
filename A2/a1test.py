from nltk.parse.generate import generate, demo_grammar
from nltk import CFG
import nltk
nltk.download('punkt')


g = """ S -> NP VP 
        S -> VP 
        S -> Aux NP VP
        S -> Where Aux NP V 
        S -> Where Aux NP V Adv
        S -> Where Aux NP V NP
        S -> Where Aux NP V NP Adv
        S -> What Aux NP V 
        S -> What Aux NP V Adv
        S -> What Aux NP V Adv PP
        S -> What Aux NP V PP
        S -> Who VP
        S -> Who Aux VP
        NP -> N | Det N | Adj N | Det Adj N
        PP -> P NP
        VP -> V
        VP -> V Adv
        VP -> V NP Adv
        VP -> V NP Adv PP
        VP -> V Adv PP
        VP -> V NP 
        VP -> V NP PP 
        VP -> V PP 
        Det -> 'the' | 'their' | 'your'
        Adj -> 'old' | 'red' | 'happy'
        Adv -> 'quickly' | 'slowly'
        N -> 'dogs' | 'parks' | 'statues' | 'people'
        V -> 'race' | 'walk' | 'eat'
        P -> 'in' | 'to' | 'on' | 'under' | 'with'
        Aux -> 'will' | 'should' 
        Who -> 'who'
        What -> 'what'
        Where -> 'where'
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

