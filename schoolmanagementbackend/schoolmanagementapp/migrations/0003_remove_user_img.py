# Generated by Django 4.0 on 2022-04-10 16:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('schoolmanagementapp', '0002_alter_user_img'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='img',
        ),
    ]
