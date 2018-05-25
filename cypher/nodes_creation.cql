// How to run: bin/neo4j-shell --file /Users/gomerudo/workspace/git_storage/tuedataeng/cypher/nodes_creation.cql

// Uniqueness constraints (to avoid duplicates)
CREATE CONSTRAINT ON (c:Community) ASSERT c.id IS UNIQUE;
CREATE CONSTRAINT ON (d:District) ASSERT d.id IS UNIQUE;
CREATE CONSTRAINT ON (n:CaseNumber) ASSERT n.id IS UNIQUE;
CREATE CONSTRAINT ON (n:Category) ASSERT n.id IS UNIQUE;


// Insert communities
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "Community" // Get only nodes labeld as community
CREATE (c:Community { id: line.NodeID, name: line.Value2 }) // Create the node with its properties
;

// Insert districts
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "District" 
CREATE (c:District { id: line.NodeID, name: line.Value2 })
;

// In case we need it, but commented now
// Insert crime types
// USING PERIODIC COMMIT 1000
// LOAD CSV WITH HEADERS 
// FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
// WITH line
// WHERE line.Value1 IS NOT NULL AND line.Value1 = "CrimeType" 
// CREATE (c:CrimeType { id: line.NodeID, name: line.Value2 })

// Insert case numbers
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "CaseNumber" 
CREATE (c:CaseNumber { id: line.NodeID, name: line.Value2, type: line.Value3, latitude:line.Value4, longitude:line.Value5 })
;

// Insert Nodes constructed based on criteria (e.g. Dangerous)
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "Category" 
CREATE (c:Category { id: line.NodeID, name: line.Value2, comment: line.Value3 })
;
