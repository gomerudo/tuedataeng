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


// Create dangereous relationship
USING PERIODIC COMMIT 1000 // We use this because it can not be done in 1 step because the size of the dataset
LOAD CSV WITH HEADERS 
FROM "file:///Users/gomerudo/workspace/datasets/timewise_edges.csv" AS line // Replace your file path! Keep the file://
WITH line
WHERE line.Value1 IS NOT NULL 
    AND line.EdgeID = "CONSIDERED" // Get only edges of type CONSIDERED
MATCH (a:Community),(b:Category)
WHERE a.id=line.FromNodeID AND b.id=line.ToNodeID
CREATE (a)-[r:CONSIDERED { id: a.id + '->' + b.id, hardshipIndex: line.Value1 } ]->(b)
;
