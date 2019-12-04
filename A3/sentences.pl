% Zhihuan Yu, yuzhihu1, 1002106650
% pass
test_sent([the,student,tried,to,sleep]).
test_sent([the,teacher,tried,to,sleep]).
test_sent([the,student,appeared,to,sleep]).
test_sent([the,teacher,appeared,to,sleep]).
test_sent([the,student,promised,the,teacher,to,sleep]).
test_sent([the,student,expected,the,teacher,to,sleep]).
test_sent([the,student,expected,the,student,to,sleep]).
test_sent([the,teacher,expected,the,student,to,sleep]).

% fail
test_sent([student,tried,to,sleep], fails).
test_sent([the,student,tried,to,tried], fails).
test_sent([the,student,sleep,to,sleep], fails).
test_sent([the,student,tried,the,teacher,to,sleep], fails).
test_sent([the,student,appeared,the,teacher,to,sleep], fails).
test_sent([the,student,expected,teacher,to,sleep], fails).
