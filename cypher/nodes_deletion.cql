// How to run: 
//   bin/neo4j-shell --file /Users/gomerudo/workspace/git_storage/tuedataeng/cypher/nodes_deletion.cql

// Delete communities together with their relationships
MATCH (n:Community) // Get all Community nodes
WITH n LIMIT 500000 // This is how many rows at the most we want to delete.
DETACH DELETE n // Delete the nodes. Detach is to remove the relations (edges)
RETURN count(*) // Return the number of nodes removed from the database.
;

// Delete districts together with their relationships
MATCH (n:District)
WITH n LIMIT 500000
DETACH DELETE n
RETURN count(*)
;

// Delete CrimeType
MATCH (n:CrimeType)
WITH n LIMIT 100000
DETACH DELETE n
RETURN count(*)
;

// Delete CaseNumber together with their relationships. 
// It just deletes a few (because of memory issues). So, run until full deletion (0 rows message)
MATCH (n:CaseNumber)
WITH n LIMIT 100000
DETACH DELETE n
RETURN count(*)
;

MATCH (n:Category)
WITH n LIMIT 100000
DETACH DELETE n
RETURN count(*)
;


