// Get the cases occurring in the day. 
MATCH (cn:CaseNumber)-[r:OCURRED_IN]-(com:Community)
WHERE 
    r.startTime =~ "2011-.*-11.*(07|08|09|10|11|12|13|14|15|16|17):.*:.*" 
RETURN distinct(r.startTime) // To test the hours expression is correct
//RETURN distinct(r.startTime) // What we really want to retrieve
LIMIT 25
;

// Get the cases occurring at night. 
MATCH (cn:CaseNumber)-[r:OCURRED_IN]-(com:Community)
WHERE 
    r.startTime =~ "2011-.*-11.*(00|01|02|03|04|05|06|18|19|20|21|22|23|24):.*:.*" 
RETURN distinct(r.startTime) // To test the hours expression is correct
//RETURN distinct(r.startTime) // What we really want to retrieve
LIMIT 25
;


// All during day
MATCH (loc:Location)<-[r1:HAS_LOCATION_TYPE]-(cn:CaseNumber)-[r2:OCURRED_IN]->(com:Community)
WHERE 
    r2.startTime =~ "2017-.*-.*(07|08|09|10|11|12|13|14|15|16|17):.*:.*" 
RETURN com.name as Community, loc.name as Location, count(loc.name) as Frequency 
ORDER BY Community, Frequency DESC
;


// Top 3 day
MATCH (n)
WHERE n:Community
CALL apoc.cypher.run("
    MATCH (loc:Location)<-[r1:HAS_LOCATION_TYPE]-(cn:CaseNumber)-[r2:OCURRED_IN]->(n)
    WHERE 
        r2.startTime =~ '2017-.*-.*(07|08|09|10|11|12|13|14|15|16|17):.*:.*' 
    RETURN n.name as Community, loc.name as LocationDay, count(loc.name) as FrequencyDay
    ORDER BY Community, FrequencyDay DESC
    LIMIT 3
  ", 
  {n:n}) YIELD value
RETURN value.Community, value.LocationDay, value.FrequencyDay
;

// All during night
MATCH (loc:Location)<-[r1:HAS_LOCATION_TYPE]-(cn:CaseNumber)-[r2:OCURRED_IN]->(com:Community)
WHERE 
    r2.startTime =~ "2017-.*-.*(00|01|02|03|04|05|06|18|19|20|21|22|23|24):.*:.*" 
RETURN com.name as Community, loc.name as Location, count(loc.name) as Frequency 
ORDER BY Community, Frequency DESC
;

//Top 3 night
MATCH (n)
WHERE n:Community
CALL apoc.cypher.run("
    MATCH (loc:Location)<-[r1:HAS_LOCATION_TYPE]-(cn:CaseNumber)-[r2:OCURRED_IN]->(n)
    WHERE 
        r2.startTime =~ '2017-.*-.*(00|01|02|03|04|05|06|18|19|20|21|22|23|24):.*:.*' 
    RETURN n.name as Community, loc.name as LocationNight, count(loc.name) as FrequencyNight 
    ORDER BY Community, FrequencyNight DESC
    LIMIT 3
  ", 
  {n:n}) YIELD value
RETURN value.Community, value.LocationNight, value.FrequencyNight
;