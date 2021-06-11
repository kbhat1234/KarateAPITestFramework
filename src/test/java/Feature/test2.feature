Feature: Test various sceanrios for assertions and match

Scenario:
	Given def color = 'red '
	And def num = 5
	
	Then assert color + num == 'red 5'
	Then print color
	Then print num
	Then print color + num
	Then print karate.pretty((color + num))
	
	Given def fname = 'karthik '
	And def lname = 'bhat'
	
	#Then match fname == 'Karthik' # this will fail
	Then match fname == 'karthik '
	Then match (fname + lname) == 'karthik bhat'
	Then assert (fname + lname) == 'karthik bhat'
	
	* def myJson = {"name": "karthik", "marks": [(90, 88, 77), (78, 88, 87)]}
	Then print myJson
	Then print myJson.name
	Then print myJson.marks
	
	Then print karate.pretty(myJson)
	
	* def someJson = [{"area":45227,"nativeName":"Eesti","capital":"Tallinn","demonym":"Estonian","flag":"https:\/\/restcountries.eu\/data\/est.svg","alpha2Code":"EE","languages":[{"nativeName":"eesti","iso639_2":"est","name":"Estonian","iso639_1":"et"}],"borders":["LVA","RUS"],"subregion":"Northern Europe","callingCodes":["372"],"regionalBlocs":[{"otherNames":[],"acronym":"EU","name":"European Union","otherAcronyms":[]}],"gini":36,"population":1315944,"numericCode":"233","alpha3Code":"EST","topLevelDomain":[".ee"],"timezones":["UTC+02:00"],"cioc":"EST","translations":{"br":"Est\u00f4nia","de":"Estland","pt":"Est\u00f3nia","ja":"\u30a8\u30b9\u30c8\u30cb\u30a2","hr":"Estonija","it":"Estonia","fa":"\u0627\u0633\u062a\u0648\u0646\u06cc","fr":"Estonie","es":"Estonia","nl":"Estland"},"name":"Estonia","altSpellings":["EE","Eesti","Republic of Estonia","Eesti Vabariik"],"region":"Europe","latlng":[59,26],"currencies":[{"symbol":"\u20ac","code":"EUR","name":"Euro"}]}]
	
	Then print karate.pretty(someJson)