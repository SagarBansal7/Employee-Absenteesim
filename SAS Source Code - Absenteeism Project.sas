/*Assignment 1: Absenteeism
Name: Sagar Bansal
Class: ST 635
*/

/*Bar Graph with response variable on X-axis and count/frequency on Y-axis*/
proc gchart data=HR;
  vbar tookLeave;
run;

/*Box plot with response variable on X-axis and salary on Y-axis*/
proc sgplot data=HR;
  vbox salary / category = tookLeave;
run;

/*Bar Graph with response variable on X-axis and age on Y-axis*/
proc sgplot data=HR;
  vbox age / category = tookLeave;
run;

/*Nummerical summary of quantitative predictors: Salary and Age*/
proc univariate data = HR;
var salary age;
run;

/*Model fitting and evaluating metrics: */
ods graphics on;
proc logistic data=HR plots(unpack) = (roc INFLUENCE);
  CLASS employmentStatus / PARAM = GLM;
  CLASS raiseOrPromo / PARAM = GLM;
  model tookLeave(event = "yesLeave") = salary employmentStatus raiseOrPromo/ ctable lackfit;
run;
ods graphics off;
