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
# with open(test_path, 'r') as f:
#     n = 0
#     passed = False
#     for line in f:
#         if "%" not in line:
#             s = nltk.tokenize.word_tokenize(line)
#             parser = nltk.parse.BottomUpChartParser(grammar)
#             for t in parser.parse_all(s):
#                 passed = True
#             if not passed:
#                 print("not passed ", line)
#                 n += 1
#             else:
#                 pass
#                 # print("passed: ", line)
#             passed = False
#     if n == 0:
#         print('All Passed')

test_path = ['Negative', 'Positive', 'Undergen', 'Overgen']
for t_path in test_path:
    with open(t_path, 'r') as f:
        n_notpass = 0
        n_pass = 0
        passed = False
        pass_list = []
        not_pass_list = []
        for line in f:
            if "%" not in line:
                s = nltk.tokenize.word_tokenize(line)
                parser = nltk.parse.BottomUpChartParser(grammar)
                for t in parser.parse_all(s):
                    passed = True
                if not passed:
                    n_notpass += 1
                    not_pass_list.append(line)
                else:
                    n_pass += 1
                    pass_list.append(line)
                passed = False
        if t_path == 'Positive' or t_path == 'Overgen':
            if n_notpass == 0:
                print('{} Correct !!!!! \n # of passed: {}, # of fails: {} \n'.format(t_path, n_pass, n_notpass))
            else:
                print(not_pass_list)
                print('{} Fail ...... \n # of passed: {}, # of fails: {} \n'.format(t_path, n_pass, n_notpass))

        else:
            if n_pass == 0:
                print('{} Correct !!!!! \n # of passed: {}, # of fails: {} \n'.format(t_path, n_pass, n_notpass))
            else:
                print(pass_list)
                print('{} Fail ....... \n # of passed: {}, # of fails: {} \n'.format(t_path, n_pass, n_notpass))

