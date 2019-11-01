from nltk.parse.generate import generate, demo_grammar
from nltk import CFG
import nltk
nltk.download('punkt')
path = ['Grammar', 'Lexicon']
g = ""
for item in path:
    with open(item, 'r') as f:
        for line in f:
            if "%" not in line:
                g += line


test_path = 'test.txt'
grammar = CFG.fromstring(g)
with open(test_path, 'r') as f:
    n = 0
    passed = False
    for line in f:
        if "%" not in line:
            s = nltk.tokenize.word_tokenize(line)
            parser = nltk.parse.BottomUpChartParser(grammar)
            for t in parser.parse_all(s):
                passed = True
            if not passed:
                print("not passed ", line)
                n += 1
            else:
                pass
                # print("passed: ", line)
            passed = False
    if n == 0:
        print('All Passed')
