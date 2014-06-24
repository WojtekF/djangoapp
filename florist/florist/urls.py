from django.conf.urls import patterns, include, url
from selling.views import AddProduct, AddDiscount
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html', 'redirect_field_name' : 'selling/statistics'},'login'),
    (r'^products/add/$',AddProduct.as_view(),{},'prod_add'),
    (r'^vats/',include('vats.urls')),
	(r'^discounts/add/$' AddDiscount.as_view(),{},'discount_add'),
    # Examples:
    # url(r'^$', 'florist.views.home', name='home'),
    # url(r'^florist/', include('florist.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
