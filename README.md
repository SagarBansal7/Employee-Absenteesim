# Employee Absenteesim #
## Graduate Course: Intermediate Statistical Modeling for Business
This was an individual project from a course on Logistic Regression (a supervised machine learning technique for statistical modeling). Below is the prompt from the client:

> Hi, I'm Pam Poovey, the director of Human Resources for Ingels Sherman International Shipping. Recently I have been concerned about how often our workers have been taking days off for either personal or family health reasons (i.e. Family and Medical Leave). The company has a very generous leave policy, but I have noticed that many more people are using the leave policy than they used to. I suspect that at least some of the employees have been taking advantage of the company's policy but I would like to see if there is some sort of pattern in what kind of employee is more likely to take days off. Our department has recorded whether or not each employee took a leave day last quarter along with some basic information that we think may be related for each employee. We recorded their currentsalary, whether the employee is full time or part time, age, and whether or not the employee got a raise or promotion in the last five years. 
> 
> Because this project is sensitive, we would like you to be an external consultant to help us analyze this data. Primarily, we would like to know if any of the factors we have access to can help us identify employees who are most likely to use a leave day. Secondarily, we would like to know how accurately the data can be used to predict whether or not an employee is likely to take a leave day during a given three-month period. As you might imagine, we want to avoid talking to employees to further investigate this issue unless we are very confident that they are likely to use the leave policy in three months. For that reason, before we use the model you develop to start investigating possible abuse the policy, is there a way to tune the model so that at most 10% of the people who don't use the leave policy are incorrected predicted by the model to use the leave policy? If the model can be tuned that way, how good will the model be at accurately identifying people who actually > will use the leave policy in three months if we do that?

### Analysis Summary

I discovered that Salary and whether a raise was given or not to the employee are crucial in identifying employees who are most likely to use a leave day. To a great surprise, employment status and age does not significantly affect the likelihood of the response. It is in contrast to the general belief that part-time employees are more likely to abuse leave policy as they are less loyal/dependent on the company. 

A good estimation of accuracy for prediction based on the data will be 62.4%. Although I can modify the model to reach up to 80% accuracy, it would drastically reduce the percentage of accurately identified employees who actually will use the leave policy. Yes, I can tune the model so that at most 10% of the people who don't use the leave policy are incorrectly predicted by the model to use the leave policy. In that case, the people that will be identified to use policy who actually will use the leave policy in three months will range from 0.0% to 17.5%.

Besides this, client should keep in mind that response may be affected by the weather and season of that quarter. The tendency to take leave may have a seasonal pattern. Also, data was highly imbalanced which could give a false sense of accuracy. Finally, additional features such as Married or not and Reason for leave may have added more to the analysis. 

### Statistical Analysis

When I summarized the given data, I found that the average value of Salary and Age variables in the given data are roughly 47519.64 USD and 35, respectively (see Table 1 to 4). I made a bar graph on the response variable i.e., tookLeave (see Figure 1). I found that 20% of the employees took a leave which is significantly high considering the short period length i.e., three months. In addition, the box plot of age categorized by tookLeave didn’t show any considerable difference between the two categories (see Figure 3). Although the minimum and maximum age is different for both categories, the mean and median are roughly same. Hence, I decided to not include age as a predictor in the model. 

#### Figure 1: Bar Graph - Frequency vs tookLeave

![Figure 1](https://user-images.githubusercontent.com/37155988/93723232-00b29f00-fb6b-11ea-9aac-74ce74cf031b.png)

#### Figure 3: Box Plot - tookLeave vs Age

![Figure 3](https://user-images.githubusercontent.com/37155988/93723235-014b3580-fb6b-11ea-97f0-35fe3428e0c2.png)

#### Figure 4: Box Plot - tookLeave vs Salary

![Figure 4](https://user-images.githubusercontent.com/37155988/93723237-014b3580-fb6b-11ea-8f62-1deca3922152.png)

#### Table 1 & 2: Numerical Summary of Salary

![Table 1 and 2](https://user-images.githubusercontent.com/37155988/93723239-01e3cc00-fb6b-11ea-804a-8cc1ee0524e7.png)

#### Table 3 & 4: Numerical Summary of Age

![Table 3 and 4](https://user-images.githubusercontent.com/37155988/93723240-01e3cc00-fb6b-11ea-9485-de7e29c847c2.png)

Since the response variable is a qualitative variable and I had to classify whether each employee is likely to take a leave or not, I used Logistic Regression in this case. The model had tookLeave as dependent variable and salary, employmentStatus & raiseOrPromo as independent variables. I found that the model is useful as the ROC curve is always above the diagonal line (random guessing) and AUC value is 0.64 which is greater than 0.5 (see Figure 2). For the model validity, I used Hosmer and Lemeshow Goodness-of-Fit Test (see Table 8) to test the null hypothesis that the logistic model built accurately describes the data at 5% significance level and found that the p-value is 0.7827 which is greater than 0.05. Hence, I fail to reject the null hypothesis i.e., there is no evidence that the model does not fit well. Moreover, I didn’t notice any pattern in Pearson Chi-Square Residuals vs Case Number plot (see Figure 5). Thus, I can say that there is no dependence issue in this model. 

#### Figure 2: ROC Curve - Sensitivity vs Specificity

![Figure 2](https://user-images.githubusercontent.com/37155988/93723234-014b3580-fb6b-11ea-80d8-76e169173833.png)

#### Table 8: Hosmer and Lemeshow Goodness-of-Fit test

![Table 8](https://user-images.githubusercontent.com/37155988/93723243-01e3cc00-fb6b-11ea-9315-e403735813da.png)

#### Figure 5: Pearson Chi-Square Residual vs Case Number Model and Outlier Diagnostics 

![Figure 5](https://user-images.githubusercontent.com/37155988/93723238-014b3580-fb6b-11ea-9ea0-08c12878d6ac.png)

#### Table 5 & 6: Analysis of Effects and Analysis of Maximum Likelihood Estimation

![Table 5 and 6](https://user-images.githubusercontent.com/37155988/93723241-01e3cc00-fb6b-11ea-9c4e-dd9cb58a6a35.png)

#### Table 7: Classification Table

![Table 7](https://user-images.githubusercontent.com/37155988/93723242-01e3cc00-fb6b-11ea-9183-16ee39a72b7b.png)

Using Wald Chi-squared test (see Table 5 & 6), I revealed that Salary (0.0001 < 0.05) and RaiseorPromo (0.0047 < 0.05) are statistically significant whereas employment status (0.2515 > 0.05) does not significantly affect the likelihood of the response at 5% significance level. incorrectly predicted by the model to use the leave policy. For the model accuracy, I chose pprob cut-off of 0.22 which results in both Specificity (64.2) and Sensitivity (55.3) greater than 50% (see Table 7). 
