# CS306 Group19

## Worldwide Energy Related Trends

### Group 19
Kağan Kağanoğlu - 29482
Ayhan Salih Öner - 29171
Yiğit Yarkın - 22464
Yarkın Alpmen Akyosun - 29505
Mehmet Faruk Kömürcüler - 25061

### Project Description:
We stored energy data that contains annual consumption, annual energy generation, share of source in total consumption, share of source in total generation and per capita energy consumption per date and per country. We kept them as weak entities as done in the recitations with COVID data, and kept primary energy sources from renewables, and from fossil fuels as attributes. We kept country code as foreign key for the entities and date as partial key to gain clear understanding of the dataset with country attributes such as GDP, population, and median age. We aim to find insights between the energy sources and the countries’ wealth or countries’ age. We will try to find answers to questions, like is decision of energy source for consumption effected by the countries’ energy generation sources or effected by the countries’ wealth, etc.

We got the data as is and removed country names in relation sets, also removed continents from the data since they are to be considered as different entities later on. We created the tables from excel and also from a script that we wrote in order to separate continents. We separated them with listed attributes and merged some of the tables such as consumption from renewables and consumption from fossil fuels into the same entity set since those attributes are covered together in the Annual Consumption Entity.

We have five tables that contain the attributes mentioned above. These tables are named as follows:
•	annual_consumption.csv
•	annual_generation.csv
•	per_capital_consumption.csv
•	share_of_energy_consumption.csv
•	share_of_energy_generation.csv
Each table contains the relevant data related to its name.

