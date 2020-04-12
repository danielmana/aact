#!/bin/sh

cd ~/git/matchtrial/hasura

# export and clear metadata
/usr/local/bin/hasura metadata export
wait
/usr/local/bin/hasura metadata clear
wait

# move to new schema
/usr/bin/curl --location --request POST 'https://matchtrial-hasura.herokuapp.com/v1/query' \
--header 'Content-Type: application/json' \
--header 'Content-Type: text/plain' \
--data-raw '{
    "type": "run_sql",
    "args": {
        "sql": "drop schema if exists ct_back; alter schema ct rename to ct_back; alter schema ctgov rename to ct; alter schema ct_back rename to ctgov;"
    }
}'
wait

# restore metadata
/usr/local/bin/hasura metadata apply

# rollback when `metadata apply` fails
# alter schema ctgov rename to ct_back;
# alter schema ct rename to ctgov;
# alter schema ct_back rename to ct;
# cd ~/git/matchtrial/hasura && /usr/local/bin/hasura metadata apply