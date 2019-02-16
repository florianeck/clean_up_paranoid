# clean_up_paranoid
Based on [https://github.com/ActsAsParanoid/acts_as_paranoid] - Which is a plugin i use on a lot of projects -
Depending on the data structure the project has - using acts_as_paranoid can cause a lot of more or less deprecated data:

For example, we [https://www.el-digital.de], are using `acts_as_paranoid` when ever it comes to price related data entries. Those data should be stored for documentation reasons - on the other hand - we dont want to mess up our database. In our case - we are talking about > 100k entries per week per table that are 'deleted'

`acts_as_paranoid` keeps all data available in the source table which makes investigation easy - but it also messes up the table causing performance to go down

## why clean_up_paranoid
using `acts_as_paranoid` happens for a reason - mostly not loosing data even if deleted.
`clean_up_paranoid` just does two things:
- clean up your main data tables
- store historical data for any further inspectation
