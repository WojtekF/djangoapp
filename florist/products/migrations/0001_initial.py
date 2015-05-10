# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('vats', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True)),
                ('isActive', models.BooleanField(default=True)),
                ('lastModification', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=256)),
                ('symbol', models.CharField(max_length=32)),
                ('nettoPrice', models.DecimalField(max_digits=6, decimal_places=2)),
                ('vatTax', models.ForeignKey(to='vats.VAT')),
                ('whoModified', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
    ]
