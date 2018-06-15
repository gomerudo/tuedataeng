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