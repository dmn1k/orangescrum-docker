# OrangeScrum

This is a docker image for [OrangeScrum](http://www.orangescrum.com/).

# Running

To run it, create a mysql container, make sure strict mode is off, and import the database.sql file.

Then, run the image, linking the mysql container:

	docker run -d --link mysql-container:mysql maienm/orangescrum

To set constants, you can pass it as an environment variable, prefixed with OSCRUM\_. Example:

	docker run -d --link --link mysql-container:mysql -e "OSCRUM_SMTP_HOST=ssl://smtp.mailgun.org" -e "OSCRUM_SMTP_PORT=465" -e "OSCRUM_SMTP_UNAME=postmaster@example.com" -e "OSCRUM_SMTP_PWORD=password"
