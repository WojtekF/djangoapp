# Create your views here.
from django.shortcuts import render_to_response, render
from forms import LoginForm
from django.template import RequestContext

def login(request):
	if request.method == 'POST':
		form = LoginForm(request.POST)
		if form.is_valid():
			print 'ok'
			return render_to_response('main.html', context_instance=RequestContext(request))
	else:
		f = LoginForm()
		return render_to_response('login.html',{'loginForm': f},context_instance=RequestContext(request))

def main(request):
	return render_to_response('main.html')


def statistics(request):
	return render_to_response('statistics.html')

def sale(request):
	return render_to_response('sale.html')
