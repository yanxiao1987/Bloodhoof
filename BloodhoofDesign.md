# Objects
## User
1. email: String
2. user_id: timeuuid
3. user_name: String
4. password: encrypted
5. gender: String
6. birthday: timestamp

## Practice
1. id: timeuuid
2. body_part: [String]
3. date: timestamp
4. exercises: [Exercise]

## Exercise
1. id: timeuuid
2. name: String
3. tool: String
4. sets: [Set]

## Set
1. id: timeuuid
2. weight: Int
3. weight_unit: String
4. reps: Int

