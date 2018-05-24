// Credentials for toy database: neo4j/dataeng18


// Create nodes
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS csvLine
MATCH (n) WHERE (csvLine.Type = "Community")
CREATE (:Community { name: n.Name })




// DELETE NODES
//   - Repeat until count = 0 due to memory issues. For details, see:
// https://stackoverflow.com/questions/44698936/neo4j-delete-graph-out-of-memory
MATCH (n:Node) WITH n LIMIT 500000
DELETE n RETURN count(*);

