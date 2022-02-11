from datetime import datetime

class random_email_generator():
	ROBOT_LIBRARY_CODE = 'TEST CASE'
	def Generate_Email(self):
		today = datetime.now()
		today=today.strftime("%m-%d-%y.%H.%M.%S.%s")
		eMail = 'selenium+' + today + '@trifectanutrition.com'
		return eMail

#print (random_email_generator.Generate_Email())