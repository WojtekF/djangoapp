from django import template

register = template.Library()

@register.filter(name="is_active")
def boolean_to_string(value):
    return "Tak" if value else "Nie"