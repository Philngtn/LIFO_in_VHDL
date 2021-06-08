# STACK DESIGN IN VHDL

### Introduction: A stack is a kind of memory structure or a way of arranging data. This kind of buffer stores and
retrieves data in the First In Last Out (FILO) order. An example of FILO order is the way we
stack dishes in a buffet, the first dish would be taken at last. The conceptual diagram is shown
in Figure 1.

![lifo](https://user-images.githubusercontent.com/60360984/121120255-34ae1d00-c7eb-11eb-89d1-78dac3b6e6ea.png)


### Design: Using LIFO controller to control the pointer indicating the amount of data in the pointer
  
  - The system overview:
  
![image](https://user-images.githubusercontent.com/60360984/121120366-658e5200-c7eb-11eb-91b4-2859f31e3ee1.png)
  
  - The register file schematic

![image](https://user-images.githubusercontent.com/60360984/121120431-848ce400-c7eb-11eb-8270-7fac4181ba2d.png)

### Simulation of register files and LIFO 
  
  - Running the simulation of register file

![image](https://user-images.githubusercontent.com/60360984/121120479-9cfcfe80-c7eb-11eb-96ca-1adb81dabbea.png)
  
  - Running the simulation of LIFO from 0 to 40 ns

![image](https://user-images.githubusercontent.com/60360984/121120545-c3bb3500-c7eb-11eb-9539-04cc9bc2fdff.png)
  
  - The simulation of LIFO from 40 to 100 ns

![image](https://user-images.githubusercontent.com/60360984/121120584-db92b900-c7eb-11eb-83c4-759d15ec40ca.png)

