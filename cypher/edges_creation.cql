
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
