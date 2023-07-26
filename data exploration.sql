
/*data exploration*/
/*my tables*/
select*
from coviddeaths;

select*
from covidvaccinations

/*Datewise Likelihood of dying due to covid-Totalcases vs TotalDeath- in south africa*/
select date,total_cases,total_deaths,(cast (total_deaths as double precision)/cast(total_cases as double precision)*100) as death_percentage 
from CovidDeaths where location like '%south africa';
/*Total % of deaths out of entire population- in India*/
select (cast(max(total_deaths) as double precision)/avg(cast(population as double precision))*100) as percentage
 from Coviddeaths
 where location like '%India%';


/*Total % of covid +ve cases- in south africa*/
select (cast(max(total_cases) as double precision)/avg(cast(population as double precision))*100) as percentage 
from Coviddeaths
 where location like '%south africa%';
 
/*Total % of covid +ve cases- in world*/
select location,(cast(max(total_cases) as double precision)/avg(cast(population as double precision))*100) as percentage 
from coviddeaths
group by location 
order by percentage desc;
/*Continentwise +ve cases*/
select location,max(total_cases) as total_cases
 from CovidDeaths
 where continent is null 
 group by location 
 order by total_cases desc;
 
/*Continentwise deaths*/
select location,max(total_deaths) as total_deaths 
from CovidDeaths 
where continent is null 
group by location 
order by total_deaths desc;

/*Daily newcases vs hospitalizations vs icu_patients- south africa*/
select date,new_cases,hosp_patients,icu_patients
 from CovidDeaths
 where location="south africa";
 
/*Total Cases vs Population
Shows what percentage of population infected with Covid*/

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From coviddeaths
Where location like '%states%'
order by 1,2;








