@startuml
left to right direction
skinparam packageStyle rectangle
actor user
rectangle main {
  user -- (choose the solution that allows the truck to return sooner)
  (choose the solution that allows the truck to return sooner) -down-> (part problem for phase w/o limit of battery) : include
  (choose the solution that allows the truck to return sooner) .> (part problem for phase with limit of battery) : include
  (part problem for phase w/o limit of battery) -up-> (implement function which calculates sum of weights) : include
  (part problem for phase w/o limit of battery) -up-> (implement function which adds truck's weight) : include
  (part problem for phase w/o limit of battery) -up->(implement function which calculates cost of sequence) : include
  (part problem for phase w/o limit of battery) -up->(implement function which finds sequence with min cost) : include
  (part problem for phase with limit of battery) .> (implement function which calculates new cost of sequence) : include
 (part problem for phase with limit of battery) .> (implement function which finds sequence with min time) : include
}

@enduml
