

  Experiments in semantic indexing

  This fledgling suite of software is a set of experiements in semantic
  indexing for the purposes of scalable reading.

  Given a corpora of plain text files, the software is designed to: 1)
  parse documents into sentences, named entities, words (tokens), lemmas,
  and parts-of-speach, and 2) create a semantic index. Once completed, the
  reader can then use various and sundry tools to "read" the corporus at
  scale.


  Getting started

  The first set of steps is to parse corpus and put the result into a
  database. Here's how:

    1. Create a corpus of plain text files, and save them in the directory
       named "corpus". It is best if the files are encoded as UTF-8 and are
       given meaningful names with a .txt extension.

    2. Initialize an SQLite database and create sets of corresponding SQL
       statements against your corpos by running ./bin/documents2sql.sh

    3. Fill the database with content using ./bin/sql2db.sh

  The reader should then be able to use a number of shell/SQL statements
  to count & tabulate various frequencies:

    # count & tabulate pos
    echo "SELECT COUNT( pos ) AS c, pos FROM tokens GROUP BY pos ORDER BY c
    DESC;" | sqlite3 ./etc/documents.db

    # count & tabulate specific pos
    echo "SELECT COUNT( LOWER ( lemma ) ) AS c, LOWER( lemma ) FROM tokens
    WHERE pos IS 'ADJ' GROUP BY LOWER( lemma ) ORDER BY c DESC LIMIT 25;" |
    sqlite3 ./etc/documents.db

    # count & tabulate specific forms of a lemma
    echo "SELECT COUNT( LOWER ( token ) ) AS c, LOWER( token ) from tokens
    where lemma is 'good' GROUP BY LOWER( token ) ORDER by c DESC LIMIT 25;"
    | sqlite3 ./etc/documents.db

    # count & tabulate types of entities
    echo "SELECT COUNT( type ) AS c, type from entities GROUP BY type ORDER
    by c DESC;" | sqlite3 ./etc/documents.db

    # count & tabulate specific entity type
    echo "SELECT COUNT( LOWER ( entity ) ) AS c, LOWER( entity ) from
    entities where type is 'EVENT' GROUP BY LOWER( entity ) ORDER by c DESC
    LIMIT 25;" | sqlite3 ./etc/documents.db

  As an exercise to the reader, learn how to query the database
  semantically. For example, find all sentences containing the pattern
  adjective-noun.  Or find all sentences with the pattern
  noun-verb-noun|adjective. Such queries extract meaning, but since
  langauge does not follow strict rules, it is nearly impossible to
  articulate a complete set of semantic patterns. And even if you did then
  the SQL would be not be elegant.

  The next step is to create a semantic index using the command
  ./bin/documents2vec.sh. Given one or more words, the reader can then
  query the index with the command ./bin/search.py. It will return a list
  of words whose vectors are closest to the input. Use the output of
  documents2vec.sh as the input against the database.

  Finally, there are to other tools in the suite, just for fun:

    1. Given a document ./bin/summarize.py will try to extracxt the most
       meaningful subset of text

    2. Given a directory (corpus), ./bin/topic-model.py will extract
       "themes" from the texts and associate each theme to one or more
       documents.


  Now the fun begins

  Peruse the SQL database (./etc/documents.db). It is relatively easy to
  extract frequecies of: 1) words (tokens), 2) lemmas ("root" words), 3)
  parts-of-speech, 4) types of named entities, and 5) named entities
  themselves. These frequencies will give you a flavor of the corpus.

  Identify words or themes of personal interest. I am always interested in
  "great ideas" such as: truth, justice, love, beauty, honor, war, peace,
  liberty, art, science, mathematics, religion, etc. Identify your own set
  of "great ideas". Search for them using the given tools, and evaluate
  the results. Ask yourself, "To what degree do I agree or disagree with
  the results?" Do patterns & anomolies exist? Are the results what you
  expected? Why or why not?

  Once you have identified things of interets, use SQL to extract
  sentences embodying those interests. Do "close reading" against the
  results. It might be easier to use a concordance to do your close
  reading. Personally, I endourse AntConc
  (http://www.laurenceanthony.net/software/antconc/). More specifically,
  learn how to use AntConc's Word List and Keyword List features.
  Alternatively, dump the subsets of the database to a tab-delimited file
  and pour the results into OpenRefine (http://openrefine.org). You can
  then use OpenRefine to drill down and dig into your data.


  Final word

  "Software is never done. If it were, then it would be called 'hardware'." 

  --
  Eric Lease Morgan <eric_morgan@infomotions.com>
  October 14, 2018




