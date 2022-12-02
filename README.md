# ALGAV_PROJECT  

# USE CASES  
<p align="center">
<b>a) The receiving data on deliveries to be made by 1 truck and on sections between warehouses: generating all possible trajectories through sequences of warehouses where deliveries must be made:</b>

![](/diagrams_UC/UC1.svg?raw=true)  
</p>  
<p align="center">
<b>b) Evaluate these trajectories according to the time to complete all deliveries and return to the Matosinhos base warehouse and choose the solution that allows the truck to return sooner:</b>

![](/diagrams_UC/UC2.svg?raw=true)  
</p>  
<p align="center">
<b>c) Increase the dimension of the problem (putting more warehouses to be visited) and verify to what extent it is feasible to proceed in the adopted way (with a generator of all the solutions) by carrying out a study of the complexity of the problem:</b>

![](/diagrams_UC/UC3.svg?raw=true)  
</p>  
<p align="center">
<b>d) Implement heuristics that can quickly generate a solution (not necessarily the best one) and evaluate the quality of these heuristics (for example, deliver to the nearest warehouse; then deliver with greater mass; combine distance for delivery with mass delivered):</b>

![](/diagrams_UC/UC4.svg?raw=true)  
</p>  

# DOMAIN KNOWLEDGE REPRESENTATION  
  **Representation of citites by knowledge base "idStore":**  
<br>
![](/images/img_to_task_A/cities.png?raw=true)  
*First parameter is the **name** of city, where is the store, the second one is the **index** of city which will be using later*  
<br>
<br>
**Representation of distances between every citites by knowledge base "dist":**  
<br>
![](/images/img_to_task_A/distances.png?raw=true)  
*On the upper ss we can see part of the knowledge base with all distances from Arouca, analogously it's looking for the rest of cities. First parameter is the **index** of the initial city, second parameter is the **distance** to final city and third parameter is the **index** of the final city*  
<br>
<br>
**Representation of the trucks and theirs characteristic:**
<br>
![](/images/img_to_task_A/trucks.png?raw=true)  
*Knowledge base "truck" define every truck with the parameter which defines truck's name. Knnowledge base "characteristicsTruck" stores truck's **name**, truck's **tare**, **maximum load capacity**, **capacity of the full load battery(in kwh)**, **maximum distance w/o charging**, **time to charge battery from 20% to 80%** in the order from the left*  
<br>
<br>
**Representation of data about path between every 2 cities, which is necessary to calculate the best solution:**  
<br>
![](/images/img_to_task_A/pathData.png?raw=true)  
 *On the upper ss we can see part of the knowledge base with all data for paths from Arouca, analogously it's looking for the rest of cities. The knowledge base "PathData" stores truck's **name**, **index** of the initial city, **index** of the final city, **time** needed to drive all road, battery's **energy** used to drive all road, potential **extra time** to recharge battery for avoiding level less than 20% in the order from the left*  
<br>
<br>
**Representation of deliveries for which we're gonna calculate optimal solution:**  
<br>
![](/images/img_to_task_A/delivieries.png?raw=true)  
*The knowledge base "delivery" stores **index** of delivery, **date**(YYYYMMDD) of the delivery, **mass** of the delivery which will be receive in considering warehouse, **index** of the city, where will be receive delivery, **time needed to place** delivery on the truck, **time needed to put off** delivery from the truck in the order of the left side*  
<br>
<br>
**Represenation of the city where trucks start and finish day of work by knowledege base "factory":**  
<br>
![](/images/img_to_task_A/factory.png?raw=true)    
*In our case is always Matosinhos, which have index number 5*  
<br>
# OPTIMAL SOLUTION FOR DELIVERIES PLANNING WITH AN ELECTRICAL TRUCK  
*To make the task easier, we part it for two phases. The goal of the first one is to find optimal sequence of deliveries disregarding battery. The algorithm, which we're using to find optimal solution is the TSP, i.e. the best permutation of all considering deliveries.*  
<br>
**First function which we made for phase 1 is "sum_weight(List of cities,List of weights, sum of weights all cities to current)", which for puting list of citites will return us the weight of the deliveries to current city in the queue and the sum of all weights:**:  
<br>
![](/images/img_to_task_B/sum_weights.png?raw=true) 
**Meaning of variables:**  
City - index of the city for which function adding weight to sum and list of the weights  
LC - list of cities after "City"  
WeightCurrent - sum of the weight of "City" and cities before  
LW - list of sum weights to cities considering before
WeightCurrent1 - sum of the weight of cities before  
Weight - weight of "City"  
<br>
**Second function is add_TruckWeight(Weight to add, List of the weights, List of the weights including first param), for putting some weight and list of the weights returns us the new list of the weight enlarged by first param:**  
![](/images/img_to_task_B/add_truckWeight.png?raw=true)  
**Meaning of variables:**  
Tare - value of the added weight  
Weight - value of the considering weight from the input list  
LW - the weights after "Weight" in the input list  
TruckWeight - sum of the input value and considering weight from the input list  
LWT - list of the weight enlarged by first param before "Weight"  
<br>
**The next one function is calculate_cost(List of cities, cost value) with ancillary function cost(List of cities, List of the weights, cost value), which for putting list of the cities returns the cost of the road in given order. Anicillary function is needed to include truck weight on the road in our calculations**  
![](/images/img_to_task_B/calculate_cost.png?raw=true)  
**Meaning of variables:**  
*calcualte_cost:*  
LC - list of the cities  
Cost - final cost to do deliveries in order from 1 param  
LW - list of deliveries's weight to every next stop  
Tare - truck's weight  
LWT - "LW" enlarged by "Tare"  
F - index of city, which is our factory  
LCcomplete - list of the cities including start and finish in factory  
*cost:*
C1 - city where the truck starts next part of the road  
C2 - city where the truck finishes next part of the road  
LC - list of citites after "C2"  
WT - weight of the truck with deliveries on the road between "C1" and "C2"  
LWT - list of the truck's weight on the next parts of the road  
Cost - cost of the road from "C1" to factory   
Cost1 - cost of the road from "C2" to factory    
T - time needed to drive from "C1" to "C2"  
Ta - truck's weight  
ML - maximum load capacity of the truck  
<br>
**So final cost is calculated by multiple time with weight of the truck's road and divide by max possible weight of the truck with deliveries for every stop**  
<br>
**Now, when we can calculate cost for every sequence it's time to find minimal value from all permutations:**  
![](/images/img_to_task_B/seq_cost_min.png?raw=true)  
**Meaning of variables:**  
LC - list of the best sequence  
Cost - value of the minimal cost  
City - index of city which participate in any of considering deliveries  
LCPerm - list of all permutations  
CostMin - minimal cost found in every sequence before considering one  
<br>
**Function at the start finds all unique cities from deliveries and return to us by the list, then returns to us list of all possible sequence, calculates cost for all and if the cost is lower than current minimal one, defines minimal cost like a this one(also current sequence like a LC) and write this value in console**  
<br>
*Ok, phase 1 is working well. Now it's time to include energy. We can use "sum_weights" and "add_truckWeight" from phase 1, but we need to modify "calculate_cost" and "seq_cost_min"*  
<br>
**Let's start with "calculate_cost_2", which is really similar to first version. Only differnces are add 3 param which stores cities where battery was charged and define energy of the truck. So we're gonna focus at the ancillary function cost_2:**  
![](/images/img_to_task_B/calculate_cost2.png?raw=true)  
**Meaning of variables:**  
S1 - city where the truck starts next part of the road  
S2 - city where the truck finishes next part of the road  
LS - list of citites after "S2"  
WT - weight of the truck with deliveries on the road between "S1" and "S2"  
LWT - list of the truck's weight on the next parts of the road  
CEnergy - truck's energy in the moment of set out from "S1"  
Time - Time needed for road from "S1" to factory  
LCharging - list of cities, where battery was charged on road from "S1" to factory  
T - time for drive from "S1" to "S2"  
En - Energy used for drive from "S1" to "S2"  
Ex_T - potential needed extra time for charge battery in case if it can be lower than 20% for drive from "S1" to "S2"  
Ta - truck's weight  
ML - maximum load capacity of the truck  
E - maximum truck's battery energy  
TCharge - time of battery charging from 20% to 80%  
NEn - real energy, which is gonna be used for drive from "S1" to "S2"  
TCharge1 - time needed to charge battery before going for next part of the road  
E1 - energy, which truck will have in moment of the start from S2  
LPreviousCharges - list of cities where battery was charged on road from "S2" to factory  
Time1 - Time needed for road from "S2" to factory  
Ex1_T - "Ex_T" including case when S1 is factory and truck has 100% battery(no 80% or less)  
RT - time for received delivery in "S1"  
<br>
**So now when we know what variables mean is time to explain this tricky function. We're considering 2 options: it's necessary to charge battery or not. First option is when current energy - real needed energy is less than 20% of battery energy, then before charging we need to check if "S2" is our factory. In that case we don't need to charge battery to 80% but only to the value, which is enough to finish with 20%. At the end we need to remember that we can charge battery in the same time as receive delivery so we add to time only max of these two**  
<br>
**Function "min_time_seq" is almost the same like the "seq_cost_min". Now we have also list of the cities when battery was charged, calculation including energy, and time measurement by "get_time", which will be useful for next task**  
![](/images/img_to_task_B/final_min_cost.png?raw=true)    
<br> 
 # STUDY OF THE PROBLEM COMPLEXITY AS WELL AS THE VIABILITY OF FINDING THE OPTIMAL SOLUTION BY GENERATING ALL THE SOLUTIONS
![](/images/img_to_task_C/Table_of_solution_times.png?raw=true)  
  
# HEURISTICS FOT THE QUICK GENERATION OF SOLUTIONS
![](/images/img_to_task_D/distance_heuristic.png?raw=true)  
![](/images/img_to_task_D/weight_heuristic.png?raw=true)  
![](/images/img_to_task_D/combine_heuristic.png?raw=true)  
# ANALYSIS OF THE HEURISTICS QUALITY
![](/images/img_to_task_D/comparing_of_heuristics_table.png?raw=true)    
# CONCLUSIONS
