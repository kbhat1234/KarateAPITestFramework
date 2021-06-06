Feature: Test

  Scenario: Test 1 scenario
    * def cat = {name: 'karthik', scores: [2,6]}
    * assert cat.scores[1] == 6
    * assert cat.scores[0] != 1
    * print cat
    * match cat.name == '#string'
    * print cat.name
    * def cats = [{ name: 'Billie' }, { name: 'Bob' }]
    * match cats[1] == { name: 'Bob' }
    * def first = cats[0]
    * match first == {name: 'Billie'}
    
    Given def cat = 
    """
    <cat>
    	<name>Billie</name>
    	<scores>
    		<score>2</score>
    		<score>5</score>
    	</scores>
    </cat>
    """
    # sadly, xpath list indexes start from 1
    Then match cat/cat/scores/score[2] == '5'