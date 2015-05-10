# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('selling', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CorrectingInvoice',
            fields=[
                ('order_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='selling.Order')),
            ],
            options={
                'abstract': False,
            },
            bases=('selling.order',),
        ),
        migrations.CreateModel(
            name='EuropeanCorrectingInvoice',
            fields=[
                ('order_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='selling.Order')),
            ],
            options={
                'abstract': False,
            },
            bases=('selling.order',),
        ),
        migrations.CreateModel(
            name='EuropeanInvoice',
            fields=[
                ('order_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='selling.Order')),
            ],
            options={
                'abstract': False,
            },
            bases=('selling.order',),
        ),
        migrations.CreateModel(
            name='Invoice',
            fields=[
                ('order_ptr', models.OneToOneField(parent_link=True, auto_created=True, primary_key=True, serialize=False, to='selling.Order')),
            ],
            options={
                'abstract': False,
            },
            bases=('selling.order',),
        ),
        migrations.AddField(
            model_name='europeancorrectinginvoice',
            name='corrected',
            field=models.ForeignKey(to='selling.EuropeanInvoice'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='correctinginvoice',
            name='corrected',
            field=models.ForeignKey(to='selling.Invoice'),
            preserve_default=True,
        ),
    ]
