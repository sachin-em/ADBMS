# Create a database named college and create collection to list and insert some values to it.

# write mongodb query to

# 1. display name (fname, lname) and mark of all female student in MCA department 
# 2. display the details of student highest mark in the course MCA 
# 3. display all male student who secure A+ grade

# 4. diplay the names of the top 3 students in mechanical dpt

# 5. display details of female student (fname, Iname nark) who achieve mark more than 98 
# 6. display the detalls of student whto secured mark morethan 80 but less than 90

# 7. display the names of student whose name starts with V 
# 8. display all students from kollam 
# 9. display all student who does not belongs to neither kollan nor trivandrum

# 10. display all female student who belongs to either kollam or trivandrum


from pymongo import MongoClient

client = MongoClient("localhost", 27017)
db = client.college
coll = db.student

print("\n1. display name (fname, lname) and mark of all female student in MCA department \n=======================================")
result = coll.find({"gender":"female", "course":"MCA"}, {"_id":0, "name":1, "mark":1})
for data in result:
	print(data["name"]["fname"],data["name"]["lname"],data["mark"])
	

print("\n2. Student with highest mark in MCA \n=======================================")
result = coll.find({"course":"MCA"}).sort("mark", -1).limit(1)
print(result[0]["name"]["fname"], result[0]["name"]["lname"], result[0]["mark"])

print("\n3. Male students who secure A+ grade \n=======================================")
result = coll.find({"grade":"A+"})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], data["grade"])
	
print("\n4. Top 3 in Mechanical department \n=======================================")
result = coll.find({"course":"Mechanical"}).sort("mark", -1).limit(3);
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], data["mark"])
	
print("\n5. Females with morethan 98 marks \n=======================================")
result = coll.find({"gender":"female", "mark":{"$gt":98}})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], data["mark"])
	
print("\n6. Student with mark between 80 and 90 \n=======================================")
result = coll.find({"gender":"female", "mark":{"$gt":80, "$lt":90}})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], data["mark"])
	
print("\n7. Students with  name starting in 'V' \n=======================================")
result = coll.find({"name.fname":{"$regex":"^(V)"}})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"])
	
print("\n8. Students from Kollam \n=======================================")
result = coll.find({"address.city":"Kollam"})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], "-",data["address"]["city"]  )
	
	
print("\n9. Students from neither Kollam nor Thiruvananthapuram\n=======================================")
result = coll.find({"$nor":[{"address.city":"Kollam"}, {"address.city":"Thiruvananthapuram"}]})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], "-",data["address"]["city"]  )
	
print("\n10. Students from either Kollam or Thiruvananthapuram\n=======================================")
result = coll.find({"$or":[{"address.city":"Kollam"}, {"address.city":"Thiruvananthapuram"}]})
for data in result:
	print(data["name"]["fname"], data["name"]["lname"], "-",data["address"]["city"]  )
	
