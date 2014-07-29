import web # http://webpy.org/
from web import db
from web import template

render = web.template.render('templates', base='layout')
urls = ('/', 'index')
app = web.application(urls, globals())

class index:
	def GET(self):
		return render.home("My Python Solution")



if __name__=="__main__":
    app.run()

