/*Sankhepo Ndhlovu*/
/*Pr. Lee Edwards*/
/*Final Project*/

/*Part 1: Introduction to the Software Interface*/
/*Creation of data library*/
libname CityBike 'U:\Documents\My SAS Files\DAD_215_Data\Final_Project';

/*Part 2: Working With the Data*/
/*Importing and Converting the Data*/
/*Importing 2013 dataset;*/
proc import
	datafile = 'U:\Documents\My SAS Files\DAD_215_Data\Final_Project.2013-07 - Citi Bike trip data.csv'
	dbms = csv /*specifying type file is csv;*/
	out = citybike2013 /*new permanent sas dataset to be created;*/
replace; *if dataset already exists;
run;

/*list first 10 observations of 2013 converted dataset;
proc print data=citybike2013; 
title '2013 City Bike';
run;

/*Importing 2014 dataset;
proc import
	datafile = 'U:\Documents\My SAS Files\DAD_215_Data\Final_Project.2014-07 - Citi Bike trip data.csv'
	dbms = csv /*specifying type file is csv;
	out = citybike2014 /*new permanent sas dataset to be created;
replace; *if dataset already exists;
run;

/*list first 10 observations of 2014 converted dataset;
proc print data=citybike2014; 
title '2014 City Bike';
run;

/*Importing 2015 dataset;
proc import
	datafile = 'U:\Documents\My SAS Files\DAD_215_Data\Final_Project.201507 - Citi Bike trip data.csv'
	dbms = csv /*specifying type file is csv;
	out = citybike2015 /*new permanent sas dataset to be created;
replace; *if dataset already exists;
run;

/*list first 10 observations of 2015 converted dataset;
proc print data=citybike2015; 
title '2015 City Bike';
run;
/////////////////////////*/

/*uploading datasets & transforming data*/
/*2013 dataset*/
data July2013;
    set CityBike.citybike2013; *calling dataset using library name;
    where birth_year ne '\N' /*and gender ne '0'*/;*excluding \N values and unknown gender;
    birth_year_num = input(birth_year, 4.);*converting birth year to numeric;

    /* Calculating age */
    if not missing(birth_year_num) then do;
        Age = year(today()) - birth_year_num;
    end;
    drop birth_year_num; *Dropping the variable birth_year_num;

 /* creating age groups using conditional formatting*/
	length AgeGroup $ 5; *specifying length of variable;
	if Age le 25 then AgeGroup = '0-25';
	else if Age ge 26 and Age le 35 then AgeGroup = '26-35';
	else if Age ge 36 and Age le 49 then AgeGroup = '36-49';
	else if Age ge 50 then AgeGroup = '50+';

	/* Create two new variables that represent the month and year */
    /* Extract date and time components from starttime */
    date_part_start = substr(starttime, 1, 10);
    time_part_start = substr(starttime, 12);
    
    /* Extract date and time components from stoptime */
    date_part_stop = substr(stoptime, 1, 10);
    time_part_stop = substr(stoptime, 12);
    
    /* Convert date component to SAS date value */
    sas_date_start = input(date_part_start, yymmdd10.);
    sas_date_stop = input(date_part_stop, yymmdd10.);

    /* Extract month and year from SAS date values */
    Month_start = month(sas_date_start);
    Year_start = year(sas_date_start);
    Month_stop = month(sas_date_stop);
    Year_stop = year(sas_date_stop);
run;

/*listing first 5 observations of 2013 dataset*/
title '2013 dataset';
proc print data = July2013 (obs = 5);
run;

/*2014 dataset*/
data July2014;
    set CityBike.citybike2014; /*calling 2014 data from library*/
    where birth_year ne '\N' /*and gender ne '0'*/;*excluding \N values and unknown gender;
    birth_year_num = input(birth_year, 4.);*converting birth year to numeric;

    /* Calculating age */
    if not missing(birth_year_num) then do;
        Age = year(today()) - birth_year_num;
    end;
    drop birth_year_num; *Dropping the variable birth_year_num;

 /* creating age groups using conditional formatting*/
	length AgeGroup $ 5; *specifying length of variable;
	if Age le 25 then AgeGroup = '0-25';
	else if Age ge 26 and Age le 35 then AgeGroup = '26-35';
	else if Age ge 36 and Age le 49 then AgeGroup = '36-49';
	else if Age ge 50 then AgeGroup = '50+';

 /* Create two new variables that represent the month and year */
    /* Extract date and time components from starttime */
    date_part_start = substr(starttime, 1, 10);
    time_part_start = substr(starttime, 12);
    
    /* Extract date and time components from stoptime */
    date_part_stop = substr(stoptime, 1, 10);
    time_part_stop = substr(stoptime, 12);
    
    /* Convert date component to SAS date value */
    sas_date_start = input(date_part_start, yymmdd10.);
    sas_date_stop = input(date_part_stop, yymmdd10.);

    /* Extract month and year from SAS date values */
    Month_start = month(sas_date_start);
    Year_start = year(sas_date_start);
    Month_stop = month(sas_date_stop);
    Year_stop = year(sas_date_stop);
run;

/*listing first 5 observations of 2014 dataset*/
title '2014 dataset';
proc print data = July2014 (obs = 5);
run;

/*2015 dataset*/
data July2015;
    set CityBike.citybike2015; /*calling 2015 data using library name*/
    where birth_year ne '\N' /*and gender ne '0'*/;*excluding \N values and unkown gender;
    birth_year_num = input(birth_year, 4.);*converting birth year to numeric;

    /* Calculating age */
    if not missing(birth_year_num) then do;
        Age = year(today()) - birth_year_num;
    end;
    drop birth_year_num; *Dropping the variable birth_year_num;

 /* creating age groups using conditional formatting*/
	length AgeGroup $ 5; *specifying length of variable;
	if Age le 25 then AgeGroup = '0-25';
	else if Age ge 26 and Age le 35 then AgeGroup = '26-35';
	else if Age ge 36 and Age le 49 then AgeGroup = '36-49';
	else if Age ge 50 then AgeGroup = '50+';

	/* Create two new variables that represent the month and year */
	/* Extract date and time components from starttime */
	date_part_start = substr(starttime, 1, 10);
	time_part_start = substr(starttime, 12);

	/* Extract date and time components from stoptime */
	date_part_stop = substr(stoptime, 1, 10);
	time_part_stop = substr(stoptime, 12);

	/* Extract month and year for starttime */
	Month_start = input(scan(date_part_start, 1, '/'), 2.); *using scan because format is mm/dd/yyyy;
	Year_start = input(scan(date_part_start, 3, '/'), 4.); *as opposed to mm-dd-yyyy like previous 2;

	/* Extract month and year for stoptime */
	Month_stop = input(scan(date_part_stop, 1, '/'), 2.);
	Year_stop = input(scan(date_part_stop, 3, '/'), 4.);
run;

/*listing first 5 observations for 2015 dataset*/
title '2015 dataset';
proc print data = July2015 (obs = 5);
run;

/*contents procedure*/
title'2013 dataset';
proc contents data = July2013;
run;

title'2014 dataset';
proc contents data = July2014;
run;

title'2015 dataset';
proc contents data = July2015;
run;

/*calculating means*/
title 'Mean for July 2013';
proc means data=July2013;
   var Age;
run;

title 'Mean for July 2014';
proc means data=July2014;
   var Age;
run;

title 'Mean for July 2015';
proc means data=July2015;
   var Age;
run;

/*calculating frequences*/
title 'Frequency for July 2013';
proc freq data=July2013;
   table usertype gender AgeGroup;
run;

title 'frequency for July 2014';
proc freq data=July2014;
   table usertype gender AgeGroup;
run;

title 'frequency for July 2015';
proc freq data=July2015;
   table usertype gender AgeGroup;
run;

/*sorting data by key identifiers*/
/* Sorting July2013 */
proc sort data=July2013;
    by usertype birth_year gender;
run;

/* Sorting July2014 */
proc sort data=July2014;
    by usertype birth_year gender;
run;

/* Sorting July2015 */
proc sort data=July2015;
    by usertype birth_year gender;
run;

/*Merging datasets by sorted IDs*/
data merged_datasets /*keeping relevant variables for analysis*/
	(keep=tripduration start_station_name end_station_name usertype 
			gender Age AgeGroup Year Start_End_Station trip_time);
    length start_station_name $ 35;
    length end_station_name $ 32;
    merge July2013 (in = data2013)
          July2014 (in = data2014)
          July2015 (in = data2015);
    by usertype birth_year gender;

/*creating new variable year to determine which year each observation belongs to*/
    if data2013 then Year = 2013;
    else if data2014 then Year = 2014;
    else if data2015 then Year = 2015;
/*Exclude missing values*/
    if not missing(Year) and not missing(usertype)
       and not missing(birth_year) and not missing(gender);

 /* Using CATS function to merge two variables & Create a new variable*/
    Start_End_Station = cats(start_station_name, ' - ', end_station_name);

 /* Utilizing conditional logic to create a new variable based on trip duration*/
 /* Convert duration to minutes */
	duration_minutes = tripduration / 60;

 /* Create a new variable for trip duration based on conditional logic */
	if duration_minutes < 5 then trip_time = "short trip";
	else trip_time = "long trip";
run;

/*listing first 5 observations*/
title 'Merged datasets';
proc print data = merged_datasets (obs=5);
run;

/*content ptocedures*/
proc contents data = merged_datasets;
run;

/*Summary for merged dataset*/
/*calculating means*/
title 'Summary Statistics';
proc means data = merged_datasets
	n min max mean maxdec=2;*number of values, minimum,maximum,mean;
	class gender AgeGroup usertype;
	var Age;
run;

/*Creating multiple datasets*/
/*Process to creating dataset for borough breakout*/
/*I want to create a horizontal barchart for trips by number oof rides so that I can identify most trips*/
/* Create a dataset with the count of rides for each combination of start and end station names */
proc sql;
    create table TripsCount as
    select Year, start_station_name, end_station_name, count(*) as ride_count
    from merged_datasets
    group by Year, start_station_name, end_station_name;
quit;

/* Sort the dataset in descending order of ride_count for each year */
proc sort data=TripsCount;
    by Year descending ride_count;
run;

/* Select the top 20 trips for each year */
data Top20Trips;
    set TripsCount;
    by Year;
    /* Initialize counter variable to keep track of the top 20 trips */
    if first.Year then counter = 0;
    /* Increment the counter for each observation within the year */
    counter + 1;
    /* Select only the first 20 observations within each year */
    if counter <= 20;
run;

proc print data = Top20Trips;
run;

/* Create horizontal bar chart using PROC GCHART */
title "Top 20 Trips by Number of Rides for Each Year";
proc gchart data=Top20Trips;
    hbar start_station_name / discrete sumvar=ride_count descending; /* Create horizontal bar chart in descending order */
    by Year; /* Separate bars by year */
    format ride_count comma12.; /* Format ride_count with commas for better readability */
    label ride_count = "Number of Rides" start_station_name = "Trip" Year = "Year"; /* Add labels */
run;

/*converting start station names to boroughs based on barchart*/
data stations_boroughs;
    set Top20Trips;
    /* Using the SELECT statement to update station names to boroughs */
    select(start_station_name);/*upcase to ensure comparisons are case-insensitive*/
        when ('Pershing Square North', 'Greenwich St & N Moore St',
			  'South End Ave & Liberty S', 'West Thames St', 
			  'Central Park S & 6 Ave', 'E 43 St & Vanderbilt Ave',
			  'E 13 St & Avenue A', 'Avenue D & E 12 St','Little West St & 1 Pl',
              'E 30 St & Park Ave S', '10 Ave & W 28 St', '11 Ave & W 27 St',
			  'Carmine St & 6 Ave', 'Leonard St & Church St', 'Old Slip & Front St',
			  'E 20 St & 2 Ave', 'Madison St & Clinton St', 'W 22 St & 10 ',
			  'W Broadway & Spring St','Cherry St','E 17 St & Broadway',
			  '1 Ave & E 44 St','W 45 St & 6 Ave',' E 16 St & 5 Ave',
			  'W 17 St & 8 Ave', 'W 21 St & 6 Ave', 'W 26 St & 8 Ave', 
			  'Cliff St & Fulton St', 'MacDougal St & Prince St',
			  'W 33 St & 7 Ave','Allen St & Hester St','11 Ave & W 59 St',
			  'Bialystoker Pl & Delancey','Madison St & Montgomery S',
			  'W 42 St & 8 Ave','E 20 St & Park ') borough = 'Manhattan';
        when ('Vesey Pl & River Terrace', 'Adelphi St & Myrtle Ave',
			  'Broadway & E 14 St', 'Broadway & Battery Pl', 'Jay St & Tech P1',
			  'Jay St & Tech Pl',
			  'Lafayette St & Jersey St','St James Pl & Oliver St',
			  'Concord St & Bridge St', 'Broadway & W 41 St',
			  'S Portland Ave & Hanson P','E 7 St & Avenue A') borough = 'Brooklyn';
        otherwise borough = 'Brooklyn'; /*'otherwise' to handle unmatched station names */
    end;
run;

/*print observations for boroughs*/
title 'station names to borough';
proc print data = stations_boroughs;
run;

/*now I want to create vertical barcharts for the borrows to compare the bike utilization*/
/* Create vertical bar chart using PROC GCHART */
title "Borough Utilization of Citi Bike Program for Each Year";
proc gchart data=stations_boroughs;
    vbar borough / discrete sumvar=ride_count; /* Create vertical bar chart */
    by Year; /* Separate bars by year */
    format ride_count comma12.; /* Format ride_count with commas for better readability */
    label borough = "Borough" ride_count = "Number of Rides" Year = "Year"; /* Add labels */
run;

/*Now I want to add the boroughs to the merged datasets to do analysis with respective boroughs*/
/* Sorting merging_datasets */
proc sort data=merged_datasets;
    by start_station_name end_station_name;
run;

/* Sorting stations_boroughs */
proc sort data=stations_boroughs;
    by start_station_name end_station_name;
run;

/* Adding stations_boroughs to merged_datasets by dropping start_station_name and end_station_name */
data merged_datasets_with_boroughs;
    merge merged_datasets stations_boroughs;
    by start_station_name end_station_name;
run;

/*listing observations*/
title 'merged_dataset_with_boroughs';
proc print data = merged_datasets_with_boroughs;
	where borough in ('Brooklyn', 'Manhattan'); /* Filter data for Brooklyn and Manhattan only */
run;


/*Now I want to create bar charts with the respective breakouts*/
/*creating charts to vizualize utilization by each category*/
/* Calculating counts and percentages for each category */
proc summary data=merged_datasets_with_boroughs nway;
    var Year;
    class Year usertype gender AgeGroup borough;
    output out=summary_counts n=count; 
run;

/* Calculate percentages for each category */
data summary_percentages;
    set summary_counts;
    by Year;
    format percent percent8.2;
    retain Total;
    if first.Year then Total = count;
    percent = (count / Total) * 100;
run;

/*Creating graphs: grouped bar charts */
/*Plotting grouped bar charts with group year subgroup age group */
title1 'Utilization of Citi Bike Program in Brooklyn and Manhattan';
title2 'by Age Group and year';
proc gchart data=summary_percentages;
    vbar borough / discrete sumvar=percent group = year subgroup=AgeGroup;
    where borough in ('Brooklyn', 'Manhattan'); /* Filter data for Brooklyn and Manhattan only */
    format percent percent8.2;
    label Year = "Year" AgeGroup = "Age Group";
run;

/* Plotting grouped bar charts with subgroup gender subgroup agegroup group year */
title1 'Utilization of Citi Bike Program in Brooklyn and Manhattan';
title2 'by gender and year';
proc gchart data=summary_percentages;
    vbar borough / discrete sumvar=percent group=Year subgroup=gender;
    where borough in ('Brooklyn', 'Manhattan'); /* Filter data for Brooklyn and Manhattan only */
    format percent percent8.2; /* Format percentage with two decimal places */
    label Year = "Year" gender = "Gender";
run;

/* Plotting grouped bar charts with subgroup gender subgroup agegroup group year */
title1 'Utilization of Citi Bike Program in Brooklyn and Manhattan';
title2 'by user type and year';
proc gchart data=summary_percentages;
    vbar borough / discrete sumvar=percent group=Year subgroup=usertype;
    where borough in ('Brooklyn', 'Manhattan'); /* Filter data for Brooklyn and Manhattan only */
    format percent percent8.2; /* Format percentage with two decimal places */
    label Year = "Year" usertype = "Subscription type";
run;


/*trying to create scatterplot*/
/* Sort the merged_datasets_with_boroughs dataset by Year and borough in ascending order */
proc sort data=merged_datasets_with_boroughs;
    by Year borough;
run;

/* Create scatter plot using PROC GPLOT */
title "Ride Count by Year for Each Borough";
proc gplot data=merged_datasets_with_boroughs;
    plot ride_count*Year = borough / overlay;
    symbol1 value=dot interpol=none; /* Set the symbol to a dot */
    axis1 label=("Year") offset=(3pct) minor=none;
    axis2 label=("Ride Count") offset=(3pct) minor=none;
    title2 "Borough";
run;
