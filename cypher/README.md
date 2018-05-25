In this directory, the scripts for nodes/edges creation/delation on Neo4j are stored. They are in the form of `.cql` files, which is the format accepted by Neo4j (similar to the .sql file in SQL databases). Look at each `.cql` file to see the details of the creation/deletion of each component. Any change for the database creation, needs to be added in these files, accordingly.

**REMEMBER TO CHANGE THE DIRECTORIES TO THE ONES IN YOUR SYSTEM** (If you wonder if this can be automated, the answer is yes, but it might be problematic if you are not familiar with working in the shell/terminal/console).

**ALSO, you will see that there is a file named `delation_automated.sh`. This works only with Linux/Mac, sorry :(**
# Nodes

To create nodes (and similarly to delete) have two options for both, nodes' creation/deletion. (You may want to delete if we make changes to the design of the database, so you will need both)

## Option 1

Run separately each of the blocks in the `nodes_deletion.cql` file (e.g. `Uniqueness constraints`, `Insert communities`). This is the simpliest one! Do not forget to change the directories.

## Option 2
A more convinient - but it may be problematic at the beginning depending on your environment - is to open run the script with the `neo4j-shell`. Of course, this is how it is done in real life, so just do it if you wanna learn :P. To do this, follow the next steps:

Open "Neo4j Desktop" -> click the project -> click in 'Manage' -> Click in 'settings' tab -> search for `dbms.shell` and uncomment all lines with the prefix `dbms.shell` -> Search for `dbms.memory.heap.max_size` and set the value to `2G` -> Search for `dbms.memory.pagecache.size` and set the value to `2G`. -> Click on "Apply" -> Accept restarting.

These steps are required only once and were needed because our dataset is very big and the databese requires more memory, so we are assigning 2GB of memory to the database to avoid errors. Now, go to the "Terminal" tab and run:

```
bin/neo4j-shell --file /Users/gomerudo/workspace/git_storage/tuedataeng/cypher/nodes_creation.cql
```

This will create the database in just one step!

# Edges

TO DO