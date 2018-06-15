// How to run: bin/neo4j-shell --file /Users/gomerudo/workspace/git_storage/tuedataeng/cypher/edges_creation.cql

// Create 'case -> community' relation
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.Value1 IS NOT NULL 
    AND line.Value2 IS NOT NULL 
    AND line.Value3 IS NOT NULL 
    AND line.EdgeID = "OCURRED_IN" // Get only edges of type OCURRED_IN
MATCH (a:CaseNumber),(b:Community)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:OCURRED_IN { id: a.id + '->' + b.id, timestamp: line.Value3, startTime: line.Value1, endTime: line.Value2 } ]->(b)
;

// Create 'case -> crime type' relation
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.EdgeID = "IS_OF_TYPE" // Get only edges of type OCURRED_IN
MATCH (a:CaseNumber),(b:CrimeType)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:IS_OF_TYPE { id: a.id + '->' + b.id } ]->(b)
;

// Create dangereous relationship
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.Value1 IS NOT NULL 
    AND line.EdgeID = "CONSIDERED"
    AND line.Value2 IS NULL // Get only edges of type CONSIDERED
MATCH (a:Community),(b:Category)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:CONSIDERED { id: a.id + '->' + b.id, rate: line.Value1 } ]->(b)
;

// Create has_ocurrence_of relationship
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.Value1 IS NOT NULL 
    AND line.Value2 IS NOT NULL 
    AND line.Value3 IS NOT NULL 
    AND line.EdgeID = "HAS_OCURRENCES_OF" // Get only edges of type HAS_OCURRENCES_OF
MATCH (a:Community),(b:CrimeType)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:HAS_OCURRENCES_OF { id: a.id + '->' + b.id, strength: line.Value1, startTime: line.Value2, endTime: line.Value3 } ]->(b)
;

// Create compliant relationship
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.Value1 IS NOT NULL 
    AND line.EdgeID = "CONSIDERED"
    AND line.Value2 IS NOT NULL // Get only edges of type CONSIDERED
MATCH (a:Community),(b:Category)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:CONSIDERED { id: a.id + '->' + b.id, rate: line.Value1, year: line.Value2 } ]->(b)
;

// Create neighbors relationship
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/neighcommun_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.EdgeID = "NEIGHBOUR_OF"
MATCH (a:Community),(b:Community)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:NEIGHBOUR_OF { id: a.id + '-' + b.id } ]->(b)
;

// Create location_type relationship
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///tmp/loconly.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.EdgeID = "LOCATION_TYPE" // Get only edges of type CONSIDERED
MATCH (a:CaseNumber),(b:Location)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:HAS_LOCATION_TYPE { id: a.id + '->' + b.id } ]->(b)
;
