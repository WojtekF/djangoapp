from django.conf.urls import patterns, include, url
from selling.views import login, main, statistics, sale
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^login/$', login),
	(r'^main/$', main),
	(r'^statistics/$', statistics),
	(r'^sale/$', sale),	
    # Examples:
    # url(r'^$', 'florist.views.home', name='home'),
    # url(r'^florist/', include('florist.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
