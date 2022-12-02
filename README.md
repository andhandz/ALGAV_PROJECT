# ALGAV_PROJECT  

# USE CASES  
<p align="center">
<b>a) The receiving data on deliveries to be made by 1 truck and on sections between warehouses: generating all possible trajectories through sequences of warehouses where deliveries must be made:

![](/diagrams_UC/UC1.svg?raw=true)  
</p>  
<p align="center">
<b>b) Evaluate these trajectories according to the time to complete all deliveries and return to the Matosinhos base warehouse and choose the solution that allows the truck to return sooner:

![](/diagrams_UC/UC2.svg?raw=true)  
</p>  
<p align="center">
<b>c) Increase the dimension of the problem (putting more warehouses to be visited) and verify to what extent it is feasible to proceed in the adopted way (with a generator of all the solutions) by carrying out a study of the complexity of the problem:

![](/diagrams_UC/UC3.svg?raw=true)  
</p>  
<p align="center">
<b>d) Implement heuristics that can quickly generate a solution (not necessarily the best one) and evaluate the quality of these heuristics (for example, deliver to the nearest warehouse; then deliver with greater mass; combine distance for delivery with mass delivered):

![](/diagrams_UC/UC4.svg?raw=true)  
</p>  

# DOMAIN KNOWLEDGE REPRESENTATION
![](/images/img_to_task_A/cities.png?raw=true)  
![](/images/img_to_task_A/distances.png?raw=true)  
![](/images/img_to_task_A/pathData.png?raw=true)  
![](/images/img_to_task_A/trucks.png?raw=true)  
![](/images/img_to_task_A/delivieries.png?raw=true)  
![](/images/img_to_task_A/factory.png?raw=true)    
  
# OPTIMAL SOLUTION FOR DELIVERIES PLANNING WITH AN ELECTRICAL TRUCK
![](/images/img_to_task_B/sum_weights.png?raw=true)  
![](/images/img_to_task_B/add_truckWeight.png?raw=true)  
![](/images/img_to_task_B/calculate_cost.png?raw=true)  
![](/images/img_to_task_B/seq_cost_min.png?raw=true)  
![](/images/img_to_task_B/calculate_cost2.png?raw=true)  
![](/images/img_to_task_B/final_min_cost.png?raw=true)    
  
 # STUDY OF THE PROBLEM COMPLEXITY AS WELL AS THE VIABILITY OF FINDING THE OPTIMAL SOLUTION BY GENERATING ALL THE SOLUTIONS
![](/images/img_to_task_C/Table_of_solution_times.png?raw=true)  
  
# HEURISTICS FOT THE QUICK GENERATION OF SOLUTIONS
![](/images/img_to_task_D/distance_heuristic.png?raw=true)  
![](/images/img_to_task_D/weight_heuristic.png?raw=true)  
![](/images/img_to_task_D/combine_heuristic.png?raw=true)  
# ANALYSIS OF THE HEURISTICS QUALITY
![](/images/img_to_task_D/comparing_of_heuristics_table.png?raw=true)    
# CONCLUSIONS
