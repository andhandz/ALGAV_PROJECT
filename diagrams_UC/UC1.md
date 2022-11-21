@startuml
left to right direction
skinparam packageStyle rectangle
actor user
rectangle main {
  user -- (generating all possible trajectories through sequences of warehouses where deliveries must be made)
  (generating all possible trajectories through sequences of warehouses where deliveries must be made) .> (Add data to code) : include
  (Add data to code) .> (Analyze Support to Practical Work of ALGAV Part 1) : include
  (generating all possible trajectories through sequences of warehouses where deliveries must be made) .> (Implement Traveling Salesman Problem for our problem) : include
  (Implement Traveling Salesman Problem for our problem) .> (Analyze Traveling Salesman Problem) : include
}
@enduml
