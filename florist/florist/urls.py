from django.conf.urls import patterns, include
from selling.views import sale, get_contractors, create_new_order
from core.forms import AuthForm
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html', 'redirect_field_name': 'selling/statistics', 'authentication_form': AuthForm}, 'login'),
    (r'^products/', include('products.urls')),
    (r'^vats/', include('vats.urls')),
    (r'^customers/', include('contractors.urls')),
    #(r'^discounts/add/$', AddDiscount.as_view(), {}, 'discount_add'),
    (r'^sale/$', sale),
    (r'^create_new_order/(?P<id>\d+)', create_new_order),
    (r'^get_contractors/$', get_contractors),
    # Examples:
    # url(r'^$', 'florist.views.home', name='home'),
    # url(r'^florist/', include('florist.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
