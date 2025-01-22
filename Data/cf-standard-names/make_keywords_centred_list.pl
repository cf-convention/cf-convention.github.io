
:- use_module(library(lists)).

% 8 May 2019 Code as found assumes standardname/4 rather than standardname/1.
% As far as I can see below, the original SN is not used, so I simplify.
%full_name('CFmetadata',SN,Words):-
%   standardname(SN,Words,_,_).
full_name('CFmetadata',_,Words):-
   standardname(Words).


nwords:-
   setof(W,word(W),Ws),
   length(Ws,Nwords),
   write('Number of words: '),write(Nwords),nl.

word(W):-
   full_name(_,_,Wlist),
   member(W,Wlist).


first_letters(Fs):-
   setof(F,first_letter(F),Fs).

first_letter(F):-
   word(W),
   atom_chars(W,[F|_]).



words_with_first_letter(Ws,F):-
   setof(W,word_with_first_letter(W,F),Ws).


word_with_first_letter(W,F):-
   word(W),
   stop_words(Wstops),
   \+ member(W,Wstops),
   atom_chars(W,[F|_]).


word(W,Wlower):-
  full_name(_,_,Wlist),
  member(W,Wlist),
  downcase_atom(W,Wlower).

words(Wlist):-
  setof((Wlower,W),word(W,Wlower),Wlist).

pair([A,B],[A,B|_]).
pair([A,B],[_|Rest]):-
  pair([A,B],Rest).

go:-
  tell('kwic_index_for_cf_standard_names.html'),
  write('<html><head><title>KWIC Index for CF Standard Names vXX</title>'),nl,
  write('<style type="text/css">'),nl,
  write('body {font-family:Arial}'),
  write('.centred_word {color:black; font-size:10pt}'),
  write('a:active {text-decoration:none; color:red}'),
  write('a:link {text-decoration:none; color:#500030}'),
  write('a:visited {text-decoration:none; color:#500030}'),
  write('a:hover {text-decoration:none; background-color:yellow}'),
  write('</style>'),nl,
  write('</head><body>'),nl,
  write('<h3>KWIC (Keyword in Context) Index for CF Standard Names, vXX</h3>'),nl,
  write('<p>Derived from the CF Standard Name table, vXX, XX XXX 20XX, publicly available at <a href="http://cfconventions.org/Data/cf-standard-names/XX/build/cf-standard-name-table.html">http://cfconventions.org/Data/cf-standard-names/XX/build/cf-standard-name-table.html</a></p>'),nl,
  make_index,
  write('<table cellspacing=0 cellpadding=0>'),
  words(Ws),
  process_all_words(Ws),
  write('</table></body></html>'),
  told.

% process_all_keywords iterates over the dictionary of individual words,
% ignores trivial ("stop") words, then produces one line for every standard
% name that contains that word.
process_all_words([]).
process_all_words([(_,Wkey)|Ws]):-   % Ignore trivial words
  stop_words(Stops),
  member(Wkey,Stops),
  process_all_words(Ws).
process_all_words([(_,Wkey)|Ws]):-   % process one keyword
  process_one_keyword(Wkey),
  process_all_words(Ws).

% process_one_keyword uses a "failure-driven loop" to find all the standard names
% that contain a certain keyword (Wkey), and print out one line in the KWIC
% index for each standard name that contains that word.
process_one_keyword(Wkey):-
  full_name(_,SN,Ws),
  member(Wkey,Ws),
  write('<tr valign="top"'),write('>'),nl,   % These 3 lines provide an anchor at the start
  write('   <td align="right">'),            % of the line for the current keyword, Wkey.
  write('<a name="'),write(Wkey),write('" />'),
  write_html(Wkey,SN,Ws),
  %link_to_cfmetadata_table(Ws),
  write('</td>'),nl,
  write('</tr>'),nl,
  fail.      % This forces the clause to fail, so it goes back to the start to
             % find another full_name containing Wkey.
process_one_keyword(_).   % Eventually, there are no more standard names containing 
% Wkey, so this clause, and hence the whole predicate, succeeds.

% The current word is the keyword (Wkey), and it is the last word in the 
% list of words.
write_html(Wkey,_,[Wkey]):-!,    
  write('</td>'),
  write('<td align="left">'),
  write('<b style="color:red">'),
  write(Wkey),
  write('</b>'),nl,
  write_html1(Wkey,[]),!.

% The current word is the keyword (Wkey), and it is NOT the last word in the 
% list of words.  So we need to follow it with an underscore.
write_html(Wkey,_,[Wkey|Ws]):-!,   % 
  write('</td>'),
  write('<td align="left">'),
  write('<b style="color:red">'),
  write(Wkey),
  write('</b>'),
  write('_'),
  write_html1(Wkey,Ws),!.

% The current word is not the keyword.
write_html(Wkey,_,[W|Ws]):-
  show_word(W),
  write_html(Wkey,_,Ws).


write_html1(_,[]):-!.
write_html1(_,[W]):-!,
   show_word1(W).
write_html1(Wkey,[W|Ws]):-
  show_word(W),
  write_html1(Wkey,Ws).

show_word(W):-
  stop_words(Stops),
  member(W,Stops),!,
  write(W),write('_').
show_word(W):-
  write('<a href="#'),write(W),write('">'),
  write(W),
  write('</a>'),write('_').

show_word1(W):-
  stop_words(Stops),
  member(W,Stops),!,
  write(W).
show_word1(W):-
  write('<a href="#'),write(W),write('">'),write(W),write('</a>').

%show_detail(SN):-
    

link_to_cfmetadata_table(Ws):-
  write(' <a href="http://cf-pcmdi.llnl.gov/documents/cf-standard-names/standard-name-table/12/cf-standard-name-table.html#'),
  write_list2(Ws),
  write('" title="Link to entry in CF metadata table"><font size="-2" color="blue">CF</font></a>').

make_index:-
   first_letters(Fs),
   write('<table>'),
   show_words_with_first_letters(Fs),
   write('</table>').


show_words_with_first_letters([]).
show_words_with_first_letters([F|Fs]):-
   words_with_first_letter(Ws,F),
   write('<tr>'),
   write('<td valign="top"><b>'),write(F),write('</b></td>'),
   write('<td>'),write_list3(Ws),write('</td>'),
   write('</tr>'),
   show_words_with_first_letters(Fs).


make_index([]).
make_index([(W,_)|Ws]):-
   stop_words(Wstops),
   member(W,Wstops),!,
   make_index(Ws).
make_index([(W,_)|Ws]):-
   write('<a href="#'),write(W),write('">'),write(W),write('</a> '),
   make_index(Ws).



write_list2([W]):-!,
  write(W).
write_list2([W|Ws]):-
  write(W),write('_'),
  write_list2(Ws).



write_list3([]).
write_list3([W|Ws]):-
   write('<a href="#'),write(W),write('">'),write(W),write('</a> '),
   write_list3(Ws).


stop_words(['',' ',and,or,the,a,an,as,at,in,be,because,between,by,
   can,for,of,due,from,during,than,that,'The',to,with]).



