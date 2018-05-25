#/bin/bash

# Very naive script to delete all nodes in database. Only works on LINUX/MAC!

# Path of DB: TO BE CHANGED per person.
db_path="/Users/gomerudo/Library/Application Support/Neo4j Desktop/Application/neo4jDatabases/database-4929d7d3-a0c0-47a6-9c06-216e37dd0c2c/installation-3.3.5"

pushd $db_path

i=1 
while [ $i -le 12 ]; do
    bin/neo4j-shell -file /Users/gomerudo/workspace/git_storage/tuedataeng/cypher/nodes_deletion.cql
    i=$((i + 1))
done

popd

# Exit successfully
exit 0
