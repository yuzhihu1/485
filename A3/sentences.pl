% Zhihuan Yu, yuzhihu1, 1002106650

% question one
% pass
test_sent([fido,feeds,the,dog]).
test_sent([fido,feeds,fido]).
test_sent([fido,feeds,biscuits], fails).
test_sent([fido,feeds,the,dog,with,biscuits]).
test_sent([biscuits,feed,biscuits], fails).
test_sent([fido,feeds,the,dog,with,the,dog]).
test_sent([the,dog,with,biscuits,feeds,the,dog]).

% fail
test_sent([fido,feeds,dog], fails).
test_sent([fido,feeds,the,fido], fails).
test_sent([fido,feeds,the,biscuits], fails).
test_sent([fido,feed,the,dog], fails).
test_sent([biscuits,feeds,the,dog], fails).



% question two
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
