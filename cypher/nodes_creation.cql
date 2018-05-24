// Uniqueness constraints.
CREATE CONSTRAINT ON (c:Community) ASSERT c.id IS UNIQUE;
CREATE CONSTRAINT ON (d:District) ASSERT d.id IS UNIQUE;
CREATE CONSTRAINT ON (d:CrimeType) ASSERT d.id IS UNIQUE;
CREATE CONSTRAINT ON (d:CaseNumber) ASSERT d.id IS UNIQUE;


// Insert communities
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "Community" 
CREATE (c:Community { id: line.NodeID, name: line.Value2 })

// Insert districts
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "District" 
CREATE (c:District { id: line.NodeID, name: line.Value2 })

// Insert crime types
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "CrimeType" 
CREATE (c:CrimeType { id: line.NodeID, name: line.Value2 })

// Insert case numbers
USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_nodes.csv" AS line
WITH line
WHERE line.Value1 IS NOT NULL AND line.Value1 = "CaseNumber" 
CREATE (c:CaseNumber { id: line.NodeID, name: line.Value2 })