person: {
	name:  string
	age:   int & >=0
	human: true // People are always humans
}

constraint_age: {
	age: <150
}

eternal_human: person & constraint_age & {
	name:  "I am eternal"
	age:   200
	human: true
}

viola: person & {
	name: "Viola"
	age:  38
}

my_person_object: person & {
	name: "John"
	age:  40
}

not_my_person_object: person & {
	name:  "notJohn"
	age:   5
	human: false
}
